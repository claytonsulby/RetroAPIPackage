//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/10/21.
//

import Foundation

public struct DecodeNilUnless<Decoded : Codable & Equatable> : Codable, Equatable {
    
    var decoded: Decoded?

    public init(_ decoded: Decoded) {
        self.decoded = decoded
    }

    public init(from decoder: Decoder) throws {

        var decodedValue:Decoded?
        
        do {
            let container = try decoder.singleValueContainer()
            decodedValue = try container.decode(Decoded.self)
        }
        catch DecodingError.typeMismatch(let type, let context) {
            
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            print("handling by returning nil.")
            
            decodedValue = nil
        }

        self.decoded = decodedValue
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded)
    }
    
    public static func == (lhs: DecodeNilUnless, rhs: DecodeNilUnless) -> Bool {
        return lhs.decoded == rhs.decoded
    }

}
