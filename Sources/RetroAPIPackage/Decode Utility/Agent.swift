//
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

    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap {
                result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }

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
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) async throws -> Response<T> {
        let (data, response) = try await URLSession.shared.data(for: request)
        let value = try decoder.decode(T.self, from: data)
        return Response(value: value, response: response)
    }
    
}
