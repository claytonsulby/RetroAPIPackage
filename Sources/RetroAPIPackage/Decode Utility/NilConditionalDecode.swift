//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/10/21.
//

import Foundation

struct NilConditionalDecode<Decoded : Codable> : Codable {

    var decoded: Decoded?

    init(_ decoded: Decoded) {
        self.decoded = decoded
    }

    init(from decoder: Decoder) throws {

        var decodedValue:Decoded?
        
        do {
            let container = try decoder.singleValueContainer()
            decodedValue = try container.decode(Decoded.self)
        }
        catch DecodingError.typeMismatch(let type, let context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
            decodedValue = nil
        }

        self.decoded = decodedValue
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded)
    }

}
