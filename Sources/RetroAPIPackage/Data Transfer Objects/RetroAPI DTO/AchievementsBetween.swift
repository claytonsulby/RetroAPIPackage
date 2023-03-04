// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let AchievementsBetween = try? newJSONDecoder().decode(AchievementsBetween.self, from: jsonData)

import Foundation

public typealias AchievementsBetween_DTO = [AchievementBetween_DTO]

// MARK: - AchievementBetween
public struct AchievementBetween_DTO {
    
    public init(date: String = "", hardcoreMode: Int = 0, achievementID: Int = 0, title: String = "", achievementDescription: String = "", badgeName: String = "", points: Int = 0, author: String = "", gameTitle: String = "", gameIcon: String = "", gameID: Int = 0, consoleName: String = "", cumulScore: Int = 0, badgeURL: String = "", gameURL: String = "") {
        self.date = date
        self.hardcoreMode = hardcoreMode
        self.achievementID = achievementID
        self.title = title
        self.achievementDescription = achievementDescription
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
    
    public var achievementID, points, hardcoreMode:Int
    public var date, title: String
    public var achievementDescription, badgeName, author: String
    public var gameTitle, gameIcon, consoleName: String
    public var cumulScore, gameID: Int
    public var badgeURL, gameURL: String

}

extension AchievementBetween_DTO : Codable {
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case hardcoreMode = "HardcoreMode"
        case achievementID = "AchievementID"
        case title = "Title"
        case achievementDescription = "Description"
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

extension AchievementBetween_DTO : Equatable {
    public static func == (lhs: AchievementBetween_DTO, rhs: AchievementBetween_DTO) -> Bool {
        return lhs.date == rhs.date &&
            lhs.hardcoreMode == rhs.hardcoreMode &&
            lhs.achievementID == rhs.achievementID &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
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

extension AchievementBetween_DTO : Hashable {
    
}

extension AchievementBetween_DTO : AchievementRowProtocol {
    
    public var displayOrder: Int? {
        nil
    }

    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self.badgeName + ".png")

    }
    
    public var dateAwarded: Date? {

        if hardcoreMode == 0 {
            return DateFormatter.date(fromString: self.date )
        } else {
            return nil
        }
        

    }

    public var dateAwardedHardcore: Date? {

        if hardcoreMode == 1 {
            return DateFormatter.date(fromString: self.date )
        } else {
            return nil
        }

    }
    
    public var isAwarded: Bool {
        
        hardcoreMode == 0
        
    }
    
    public var isAwardedHardcore: Bool {
    
        hardcoreMode == 1
        
    }
    

    
}
