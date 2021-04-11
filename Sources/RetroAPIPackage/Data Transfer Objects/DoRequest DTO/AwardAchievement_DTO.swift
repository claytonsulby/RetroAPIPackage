// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct AwardAchievement_DTO: Codable, Equatable {
    public init(success: Bool? = nil, score: Int? = nil, achievementID: Int? = nil, error: String? = nil) {
        self.success = success
        self.score = score
        self.achievementID = achievementID
        self.error = error
    }
    
    public var success: Bool?
    public var score, achievementID: Int?
    public var error: String?

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case score = "Score"
        case achievementID = "AchievementID"
        case error = "Error"
    }
    
    public static func == (lhs: AwardAchievement_DTO, rhs: AwardAchievement_DTO) -> Bool {
        return lhs.success == rhs.success &&
            lhs.score == rhs.score &&
            lhs.achievementID == rhs.achievementID &&
            lhs.error == rhs.error
    }
}
