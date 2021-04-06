// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(ConsoleID_DTO.self, from: jsonData)

import Foundation

// MARK: - ConsoleID_DTO
public struct ConsoleID_DTO: Codable, Equatable {
    internal init(id: String? = nil, name: String? = nil) {
        self.id = id
        self.name = name
    }
    
    public var id, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
    
    public static func == (lhs: ConsoleID_DTO, rhs: ConsoleID_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name
    }
}

public typealias ConsoleIDs_DTO = [ConsoleID_DTO]
