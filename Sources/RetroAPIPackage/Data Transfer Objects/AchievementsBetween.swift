// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let AchievementsBetween = try? newJSONDecoder().decode(AchievementsBetween.self, from: jsonData)

import Foundation

// MARK: - AchievementBetween
public struct AchievementBetween_DTO: Codable, Equatable {
    public init(date: String? = nil, hardcoreMode: String? = nil, achievementID: String? = nil, title: String? = nil, welcomeDescription: String? = nil, badgeName: String? = nil, points: String? = nil, author: String? = nil, gameTitle: String? = nil, gameIcon: String? = nil, gameID: String? = nil, consoleName: String? = nil, cumulScore: Int? = nil, badgeURL: String? = nil, gameURL: String? = nil) {
        self.date = date
        self.hardcoreMode = hardcoreMode
        self.achievementID = achievementID
        self.title = title
        self.welcomeDescription = welcomeDescription
        self.badgeName = badgeName
        self.points = points
        self.author = author
        self.gameTitle = gameTitle
        self.gameIcon = gameIcon
        self.gameID = gameID
        self.consoleName = consoleName
        self.cumulScore = cumulScore
        self.badgeURL = badgeURL
        self.gameURL = gameURL
    }
    
    public var date, hardcoreMode, achievementID, title: String?
    public var welcomeDescription, badgeName, points, author: String?
    public var gameTitle, gameIcon, gameID, consoleName: String?
    public var cumulScore: Int?
    public var badgeURL, gameURL: String?

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
    
    public static func == (lhs: AchievementBetween_DTO, rhs: AchievementBetween_DTO) -> Bool {
        return lhs.date == rhs.date &&
            lhs.hardcoreMode == rhs.hardcoreMode &&
            lhs.achievementID == rhs.achievementID &&
            lhs.title == rhs.title &&
            lhs.welcomeDescription == rhs.welcomeDescription &&
            lhs.badgeName == rhs.badgeName &&
            lhs.points == rhs.points &&
            lhs.author == rhs.author &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.gameIcon == rhs.gameIcon &&
            lhs.gameID == rhs.gameID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.cumulScore == rhs.cumulScore &&
            lhs.badgeURL == rhs.badgeURL &&
            lhs.gameURL == rhs.gameURL
    }
}

public typealias AchievementsBetween_DTO = [AchievementBetween_DTO]
