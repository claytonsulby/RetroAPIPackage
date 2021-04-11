// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login_DTO.self, from: jsonData)

import Foundation

// MARK: - Login_DTO
public struct Login_DTO: Codable {
    public var success: Bool?
    public var user, token: String?
    public var score, messages: Int?
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case user = "User"
        case token = "Token"
        case score = "Score"
        case messages = "Messages"
        case error = "Error"
    }
}
