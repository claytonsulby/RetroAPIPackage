// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementCount_DTO: Codable, Equatable {
    public init(gameID: Int? = nil, achievementIDs: [Int]? = nil) {
        self.gameID = gameID
        self.achievementIDs = achievementIDs
    }
    
    public var gameID: Int?
    public var achievementIDs: [Int]?

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case achievementIDs = "AchievementIDs"
    }
    
    public static func == (lhs: AchievementCount_DTO, rhs: AchievementCount_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.achievementIDs == rhs.achievementIDs
    }
}
