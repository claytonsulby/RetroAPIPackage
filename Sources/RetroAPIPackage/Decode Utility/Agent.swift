//  Agent.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/30/21.
//

import Foundation
import Combine

@available(iOS 13.0, macOS 10.15, *)
struct Agent {
    
    struct Response<T> {
        internal init(value: T, response: URLResponse) {
            self.value = value
            self.response = response
        }
        
        let value: T
        let response: URLResponse
    }
    
    enum ServiceErrors: Error {
        case internalError(_ statusCode: Int)
        case serverError(_ statusCode: Int)
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) throws -> Response<T> in
                //TODO: redirect
                try handleNetworkError(response: response)
                let value:T = try handleDecodeError(data: data, decoder: decoder)
                return Response(value: value, response: response)
            }
            .retryWhen({ error in
                guard let networkError = error as? NetworkError else { return false }
                return networkError.canBeRetried()
            }, maxRetries: 3)
            .eraseToAnyPublisher()
    }
    
    @available(*, deprecated, message: "use `run` with completion handler accepting `Result<T, Error>` instead")
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder(), completion: @escaping (T) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            guard let data = data else {
                print("invalid response")
                return
            }
            
            do {
                completion(try decoder.decode(T.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
            
        }).resume()
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error { completion(.failure(error)) }
            guard let response, let data else { return }

            do {
                try handleNetworkError(response: response)
                let value:T = try handleDecodeError(data: data, decoder: decoder)
                completion(.success(value))
            } catch {
                completion(.failure(error))
            }
            
        }).resume()
    }
    
    @available(*, deprecated, message: "use `run` returning `Result<T, Error>` instead")
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) async throws -> Response<T> {
        let (data, response) = try await URLSession.shared.data(for: request)
        let value = try decoder.decode(T.self, from: data)
        return Response(value: value, response: response)
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) async -> Result<T, Error> {
        do {
            var (data, response) = try await URLSession.shared.data(for: request)
            (data, response) = try await handleRedirection(request: request, data: data, response: response)
            try handleNetworkError(response: response)
            let value:T = try handleDecodeError(data: data, decoder: decoder)
            return .success(value)
        } catch {
            return .failure(error)
        }
    }
    
}

extension Agent {
    
}

extension Publisher {
    func retryWhen(_ shouldRetry: @escaping (Failure) -> Bool, maxRetries: Int) -> AnyPublisher<Output, Failure> {
        var retries = 0
        return self
            .flatMapError { error -> AnyPublisher<Output, Failure> in
                if shouldRetry(error) && retries < maxRetries {
                    retries += 1
                    return self.retryWhen(shouldRetry, maxRetries: maxRetries)
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: error).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    func flatMapError<E: Error>(_ transform: @escaping (Failure) -> AnyPublisher<Output, E>) -> AnyPublisher<Output, E> {
        return self
            .catch { error -> AnyPublisher<Output, E> in
                transform(error)
            }
            .eraseToAnyPublisher()
    }
}


//MARK: Error Handling
extension Agent {
    
    private func handleRedirection(request: URLRequest, data:Data, response:URLResponse, redirections: Int = 0) async throws -> (Data, URLResponse) {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        if (300...399).contains(httpResponse.statusCode) {
            
            guard redirections < 5 else {
                throw NetworkError.requestFailed(reason: "Too many redirects - \(redirections)") // Avoid redirect loops
            }
            
            // Check if there's a Location header to follow
            if let locationHeader = httpResponse.allHeaderFields["Location"] as? String,
               let url = URL(string: locationHeader, relativeTo: httpResponse.url) {
                
                var redirectedRequest = request
                redirectedRequest.url = url
                
                let (redirectedData, redirectedResponse) = try await URLSession.shared.data(for: redirectedRequest)
                return try await handleRedirection(request: redirectedRequest, data: redirectedData, response: redirectedResponse, redirections: redirections + 1)
                
            } else {
                throw NetworkError.requestFailed(reason: "Invalid redirection url")
            }
        }
        
        return (data, response)
    }
    
    
    private func handleNetworkError(response:URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 100...399:
            break
        default:
            let error = NetworkError.from(statusCode: httpResponse.statusCode)
            throw error
        }
    }
    
    private func handleDecodeError<T: Decodable>(data: Data, decoder: JSONDecoder) throws -> T {
        do {
            // Check for a specific error response
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                if let success = jsonObject["success"] as? Bool, !success {
                    throw DecodeError.invalidResponse(rawData: data)
                }
                if let message = jsonObject["message"] as? String, let errors = jsonObject["errors"] as? [[String: Any]] {
                    let errorDetails = errors.compactMap { errorDict in
                        guard let status = errorDict["status"] as? Int,
                              let code = errorDict["code"] as? String,
                              let title = errorDict["title"] as? String else { return nil }
                        return "Status: \(status), Code: \(code), Title: \(title)"
                    }.joined(separator: "; ")
                    throw DecodeError.invalidResponse(rawData: Data("\(message): \(errorDetails)".utf8))
                }
            }
            return try decoder.decode(T.self, from: data)
        } catch let error as DecodingError {
            switch error {
            case DecodingError.dataCorrupted(let context):
                throw DecodeError.dataCorrupted(context: context, rawData: data)
            case DecodingError.keyNotFound(let key, let context):
                throw DecodeError.keyNotFound(key: key, context: context, rawData: data)
            case DecodingError.valueNotFound(let value, let context):
                throw DecodeError.valueNotFound(value: value, context: context, rawData: data)
            case DecodingError.typeMismatch(let type, let context):
                throw DecodeError.typeMismatch(type: type, context: context, rawData: data)
            default:
                throw error
            }
        } catch let error as URLError {
            throw error
        } catch {
            throw error
        }
    }
    
}

