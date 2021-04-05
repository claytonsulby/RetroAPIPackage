// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let AchievementsBetween = try? newJSONDecoder().decode(AchievementsBetween.self, from: jsonData)

import Foundation

// MARK: - AchievementBetween
public struct AchievementBetween_DTO: Hashable, Codable {
    var date, hardcoreMode, achievementID, title: String?
    var welcomeDescription, badgeName, points, author: String?
    var gameTitle, gameIcon, gameID, consoleName: String?
    var cumulScore: Int?
    var badgeURL, gameURL: String?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case hardcoreMode = "HardcoreMode"
        case achievementID = "AchievementID"
        case title = "Title"
        case welcomeDescription = "Description"
        case badgeName = "BadgeName"
        case points = "Points"
        case author = "Author"
        case gameTitle = "GameTitle"
        case gameIcon = "GameIcon"
        case gameID = "GameID"
        case consoleName = "ConsoleName"
        case cumulScore = "CumulScore"
        case badgeURL = "BadgeURL"
        case gameURL = "GameURL"
    }
}

public typealias AchievementsBetween_DTO = [AchievementBetween_DTO]
