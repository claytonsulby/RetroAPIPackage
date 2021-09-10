//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/10/21.
//

//https://stackoverflow.com/questions/44594652/swift-4-json-decodable-simplest-way-to-decode-type-change

import Foundation

/// [Stack Overflow](https://stackoverflow.com/questions/44594652/swift-4-json-decodable-simplest-way-to-decode-type-change)
struct StringCodableMap<Decoded : LosslessStringConvertible> : Codable {

    var decoded: Decoded

    init(_ decoded: Decoded) {
        self.decoded = decoded
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)

        guard let decoded = Decoded(decodedString) else {
            throw DecodingError.dataCorruptedError(
                in: container, debugDescription: """
                The string \(decodedString) is not representable as a \(Decoded.self)
                """
            )
        }

        self.decoded = decoded
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded.description)
    }

}
