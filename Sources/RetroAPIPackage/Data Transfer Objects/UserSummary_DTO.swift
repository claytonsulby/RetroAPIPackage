// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable {
    var recentlyPlayedCount: Int?
    var recentlyPlayed: [RecentlyPlayed_DTO]?
    var memberSince: String?
    var lastActivity: LastActivity_DTO?
    var richPresenceMsg, lastGameID: String?
    var lastGame: LastGame_DTO?
    var contribCount, contribYield, totalPoints, totalTruePoints: PHPHelper.JSONIntOrString?
    var permissions, untracked, id, userWallActive: String?
    var motto: String?
    var rank: Int?
    var awarded: [String: Awarded_DTO]?
    var recentAchievements: [String: [String: RecentAchievement_DTO]]?
    var points, userPic, totalRanked, status: String?

    enum CodingKeys: String, CodingKey {
        case recentlyPlayedCount = "RecentlyPlayedCount"
        case recentlyPlayed = "RecentlyPlayed"
        case memberSince = "MemberSince"
        case lastActivity = "LastActivity"
        case richPresenceMsg = "RichPresenceMsg"
        case lastGameID = "LastGameID"
        case lastGame = "LastGame"
        case contribCount = "ContribCount"
        case contribYield = "ContribYield"
        case totalPoints = "TotalPoints"
        case totalTruePoints = "TotalTruePoints"
        case permissions = "Permissions"
        case untracked = "Untracked"
        case id = "ID"
        case userWallActive = "UserWallActive"
        case motto = "Motto"
        case rank = "Rank"
        case awarded = "Awarded"
        case recentAchievements = "RecentAchievements"
        case points = "Points"
        case userPic = "UserPic"
        case totalRanked = "TotalRanked"
        case status = "Status"
    }
}

// MARK: - Awarded
public struct Awarded_DTO: Codable {
    var numPossibleAchievements, possibleScore: PHPHelper.JSONIntOrString?
    var numAchieved, scoreAchieved: PHPHelper.JSONIntOrString?
    var numAchievedHardcore, scoreAchievedHardcore: PHPHelper.JSONIntOrString?

    enum CodingKeys: String, CodingKey {
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
        case numAchievedHardcore = "NumAchievedHardcore"
        case scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
}

// MARK: - LastActivity
public struct LastActivity_DTO: Codable {
    var id, timestamp, lastupdate, activitytype: String?
    var user: String?
    var data, data2: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case timestamp, lastupdate, activitytype
        case user = "User"
        case data, data2
    }
}

// MARK: - LastGame
public struct LastGame_DTO: Codable {
    var id: Int?
    var title: String?
    var consoleID, forumTopicID, flags: Int?
    var imageIcon, imageTitle, imageIngame, imageBoxArt: String?
    var publisher, developer, genre, released: String?
    var isFinal: Bool?
    var consoleName, richPresencePatch: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case imageIcon = "ImageIcon"
        case imageTitle = "ImageTitle"
        case imageIngame = "ImageIngame"
        case imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case released = "Released"
        case isFinal = "IsFinal"
        case consoleName = "ConsoleName"
        case richPresencePatch = "RichPresencePatch"
    }
}

// MARK: - RecentAchievement
public struct RecentAchievement_DTO: Hashable, Codable {
    var id, gameID, gameTitle, title: String?
    var recentAchievementDescription, points, badgeName, isAwarded: String?
    var dateAwarded, hardcoreAchieved: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case gameID = "GameID"
        case gameTitle = "GameTitle"
        case title = "Title"
        case recentAchievementDescription = "Description"
        case points = "Points"
        case badgeName = "BadgeName"
        case isAwarded = "IsAwarded"
        case dateAwarded = "DateAwarded"
        case hardcoreAchieved = "HardcoreAchieved"
    }
}

// MARK: - RecentlyPlayed
public struct RecentlyPlayed_DTO: Codable {
    var gameID, consoleID, consoleName, title: String?
    var imageIcon, lastPlayed: String?
    var myVote: String? //FIXME: type mismatch

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case title = "Title"
        case imageIcon = "ImageIcon"
        case lastPlayed = "LastPlayed"
        case myVote = "MyVote"
    }
}
