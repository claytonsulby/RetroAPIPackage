//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/10/21.
//

//https://stackoverflow.com/questions/44594652/swift-4-json-decodable-simplest-way-to-decode-type-change

import Foundation

/// [Stack Overflow](https://stackoverflow.com/questions/44594652/swift-4-json-decodable-simplest-way-to-decode-type-change)
public struct StringMapTo<Decoded : LosslessStringConvertible & Equatable> : Codable, Equatable {

    var decoded: Decoded

    public init(_ decoded: Decoded) {
        self.decoded = decoded
    }

    public init(from decoder: Decoder) throws {

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

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded.description)
    }
    
    public static func == (lhs: StringMapTo, rhs: StringMapTo) -> Bool {
        return lhs.decoded == rhs.decoded
    }

}
