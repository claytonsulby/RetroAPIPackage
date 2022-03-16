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
            .dataTaskPublisher(for: request) // 3
            .tryMap { result -> Response<T> in
                
                let value = try decoder.decode(T.self, from: result.data) // 4
                return Response(value: value, response: result.response) // 5
                

                
            }
            .mapError({ error in
                switch error {
                case DecodingError.dataCorrupted(let context):
                    print(context)
                case DecodingError.keyNotFound(let key, let context):
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                case DecodingError.valueNotFound(let value, let context):
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                case DecodingError.typeMismatch(let type, let context):
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                default:
                    print("error: ", error)
                }
                return error
            })
            .receive(on: DispatchQueue.main) // 6
            .eraseToAnyPublisher() // 7
    }
    
    func makeRequest(_ url:URL, completionHandler: @escaping (Data) -> Void) {

        var urlRequest: URLRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in

            guard let data = data else {
                print("invalid response")
                return
            }

            completionHandler(data)


        }).resume()

    }
    
}
