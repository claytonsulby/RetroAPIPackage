// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct AwardAchievement_DTO: Codable {
    public var success: Bool?
    public var score, achievementID: Int?
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case score = "Score"
        case achievementID = "AchievementID"
        case error = "Error"
    }
}
