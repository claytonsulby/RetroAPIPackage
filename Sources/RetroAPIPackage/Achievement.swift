// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Universal Achievement Struct
public struct Achievement_DTO: Codable, Equatable {
    internal init(id: String? = nil, numAwarded: String? = nil, numAwardedHardcore: String? = nil, title: String? = nil, description: String? = nil, points: String? = nil, trueRatio: String? = nil, author: String? = nil, dateModified: String? = nil, dateCreated: String? = nil, badgeName: String? = nil, displayOrder: String? = nil, memAddr: String? = nil, gameID: String? = nil, gameTitle: String? = nil, isAwarded: String? = nil, dateAwarded: String? = nil, hardcoreAchieved: String? = nil, dateEarned: String? = nil, date: String? = nil, hardcoreMode: String? = nil, achievementID: String? = nil, gameIcon: String? = nil, consoleName: String? = nil, cumulScore: Int? = nil, badgeURL: String? = nil, gameURL: String? = nil) {
        self.id = id
        self.numAwarded = numAwarded
        self.numAwardedHardcore = numAwardedHardcore
        self.title = title
        self.description = description
        self.points = points
        self.trueRatio = trueRatio
        self.author = author
        self.dateModified = dateModified
        self.dateCreated = dateCreated
        self.badgeName = badgeName
        self.displayOrder = displayOrder
        self.memAddr = memAddr
        self.gameID = gameID
        self.gameTitle = gameTitle
        self.isAwarded = isAwarded
        self.dateAwarded = dateAwarded
        self.hardcoreAchieved = hardcoreAchieved
        self.dateEarned = dateEarned
        self.date = date
        self.hardcoreMode = hardcoreMode
        self.achievementID = achievementID
        self.gameIcon = gameIcon
        self.consoleName = consoleName
        self.cumulScore = cumulScore
        self.badgeURL = badgeURL
        self.gameURL = gameURL
    }
    
    public var id, numAwarded, numAwardedHardcore, title: String?
    public var description, points, trueRatio, author: String?
    public var dateModified, dateCreated, badgeName, displayOrder: String?
    public var memAddr, gameID, gameTitle, isAwarded: String?
    public var dateAwarded, hardcoreAchieved, dateEarned, date: String?
    public var hardcoreMode, achievementID, gameIcon, consoleName: String?
    public var cumulScore: Int?
    public var badgeURL, gameURL: String?

    public enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numAwarded = "NumAwarded"
        case numAwardedHardcore = "NumAwardedHardcore"
        case title = "Title"
        case description = "Description"
        case points = "Points"
        case trueRatio = "TrueRatio"
        case author = "Author"
        case dateModified = "DateModified"
        case dateCreated = "DateCreated"
        case badgeName = "BadgeName"
        case displayOrder = "DisplayOrder"
        case memAddr = "MemAddr"
        case gameID = "GameID"
        case gameTitle = "GameTitle"
        case isAwarded = "IsAwarded"
        case dateAwarded = "DateAwarded"
        case hardcoreAchieved = "HardcoreAchieved"
        case dateEarned = "DateEarned"
        case date = "Date"
        case hardcoreMode = "HardcoreMode"
        case achievementID = "AchievementID"
        case gameIcon = "GameIcon"
        case consoleName = "ConsoleName"
        case cumulScore = "CumulScore"
        case badgeURL = "BadgeURL"
        case gameURL = "GameURL"
    }
    
    public static func == (lhs: Achievement_DTO, rhs: Achievement_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.numAwarded == rhs.numAwarded &&
            lhs.numAwardedHardcore == rhs.numAwardedHardcore &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.points == rhs.points &&
            lhs.trueRatio == rhs.trueRatio &&
            lhs.author == rhs.author &&
            lhs.dateModified == rhs.dateModified &&
            lhs.dateCreated == rhs.dateCreated &&
            lhs.badgeName == rhs.badgeName &&
            lhs.displayOrder == rhs.displayOrder &&
            lhs.memAddr == rhs.memAddr &&
            lhs.gameID == rhs.gameID &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.isAwarded == rhs.isAwarded &&
            lhs.dateAwarded == rhs.dateAwarded &&
            lhs.hardcoreAchieved == rhs.hardcoreAchieved &&
            lhs.dateEarned == rhs.dateEarned &&
            lhs.date == rhs.date &&
            lhs.hardcoreMode == rhs.hardcoreMode &&
            lhs.achievementID == rhs.achievementID &&
            lhs.gameIcon == rhs.gameIcon &&
            lhs.consoleName == rhs.consoleName &&
            lhs.cumulScore == rhs.cumulScore &&
            lhs.badgeURL == rhs.badgeURL &&
            lhs.gameURL == rhs.gameURL
    }
}

public typealias Achievements_DTO = [Achievement_DTO]

extension Achievement_DTO : Hashable {
    
}
