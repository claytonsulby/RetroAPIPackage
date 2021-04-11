// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login_DTO.self, from: jsonData)

import Foundation

// MARK: - Login_DTO
public struct Login_DTO: Codable, Equatable {
    public init(success: Bool? = nil, user: String? = nil, token: String? = nil, score: Int? = nil, messages: Int? = nil, error: String? = nil) {
        self.success = success
        self.user = user
        self.token = token
        self.score = score
        self.messages = messages
        self.error = error
    }
    
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
    
    public static func == (lhs: Login_DTO, rhs: Login_DTO) -> Bool {
        return lhs.success == rhs.success &&
            lhs.user == rhs.user &&
            lhs.token == rhs.token &&
            lhs.score == rhs.score &&
            lhs.messages == rhs.messages &&
            lhs.error == rhs.error
    }
}
