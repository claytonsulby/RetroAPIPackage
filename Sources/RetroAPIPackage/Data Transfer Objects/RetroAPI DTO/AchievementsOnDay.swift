//
//  AchievementsOnDay.swift
//  JSFun
//
//  Created by Clayton Sulby on 4/4/21.
//

import Foundation

public typealias AchievementsOnDay_DTO = [AchievementOnDay_DTO]

public struct AchievementOnDay_DTO : Codable, Equatable {
    public init(date: String = "", hardcoreMode: Int = 0, achievementID: Int = 0, title: String = "", welcomeDescription: String = "", badgeName: String = "", points: Int = 0, author: String = "", gameTitle: String = "", gameIcon: String = "", gameID: Int = 0, consoleName: String = "", cumulScore: Int = 0, badgeURL: String = "", gameURL: String = "") {
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
    
    
    let hardcoreMode, achievementID, points: Int
    let date, title, welcomeDescription, badgeName : String
    let author: String
    let gameTitle: String
    let gameIcon: String
    let gameID: Int
    let consoleName: String
    let cumulScore: Int
    let badgeURL: String
    let gameURL: String
    
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
    
    public static func == (lhs: AchievementOnDay_DTO, rhs: AchievementOnDay_DTO) -> Bool {
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
