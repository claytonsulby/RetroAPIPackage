// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let success = try? newJSONDecoder().decode(Success_DTO.self, from: jsonData)

import Foundation

// MARK: - Success_DTO
public struct Success_DTO: Codable {
    public var success: Bool?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
    }
}
