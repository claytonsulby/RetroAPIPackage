// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(ConsoleID_DTO.self, from: jsonData)

import Foundation

// MARK: - ConsoleID_DTO
struct ConsoleID_DTO: Codable {
    var id, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case name = "Name"
    }
}

typealias ConsoleIDs_DTO = [ConsoleID_DTO]
