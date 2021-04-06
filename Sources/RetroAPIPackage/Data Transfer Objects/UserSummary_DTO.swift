// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(recentlyPlayedCount: Int? = nil, recentlyPlayed: [RecentlyPlayed_DTO]? = nil, memberSince: String? = nil, lastActivity: LastActivity_DTO? = nil, richPresenceMsg: String? = nil, lastGameID: String? = nil, lastGame: LastGame_DTO? = nil, contribCount: PHPHelper.JSONIntOrString? = nil, contribYield: PHPHelper.JSONIntOrString? = nil, totalPoints: PHPHelper.JSONIntOrString? = nil, totalTruePoints: PHPHelper.JSONIntOrString? = nil, permissions: String? = nil, untracked: String? = nil, id: String? = nil, userWallActive: String? = nil, motto: String? = nil, rank: Int? = nil, awarded: [String : Awarded_DTO]? = nil, recentAchievements: [String : [String : RecentAchievement_DTO]]? = nil, points: String? = nil, userPic: String? = nil, totalRanked: String? = nil, status: String? = nil) {
        self.recentlyPlayedCount = recentlyPlayedCount
        self.recentlyPlayed = recentlyPlayed
        self.memberSince = memberSince
        self.lastActivity = lastActivity
        self.richPresenceMsg = richPresenceMsg
        self.lastGameID = lastGameID
        self.lastGame = lastGame
        self.contribCount = contribCount
        self.contribYield = contribYield
        self.totalPoints = totalPoints
        self.totalTruePoints = totalTruePoints
        self.permissions = permissions
        self.untracked = untracked
        self.id = id
        self.userWallActive = userWallActive
        self.motto = motto
        self.rank = rank
        self.awarded = awarded
        self.recentAchievements = recentAchievements
        self.points = points
        self.userPic = userPic
        self.totalRanked = totalRanked
        self.status = status
    }
    
    public var recentlyPlayedCount: Int?
    public var recentlyPlayed: [RecentlyPlayed_DTO]?
    public var memberSince: String?
    public var lastActivity: LastActivity_DTO?
    public var richPresenceMsg, lastGameID: String?
    public var lastGame: LastGame_DTO?
    public var contribCount, contribYield, totalPoints, totalTruePoints: PHPHelper.JSONIntOrString?
    public var permissions, untracked, id, userWallActive: String?
    public var motto: String?
    public var rank: Int?
    public var awarded: [String: Awarded_DTO]?
    public var recentAchievements: [String: [String: RecentAchievement_DTO]]?
    public var points, userPic, totalRanked, status: String?
    
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
    
    public static func == (lhs: UserSummary_DTO, rhs: UserSummary_DTO) -> Bool {
        return lhs.recentlyPlayedCount == rhs.recentlyPlayedCount &&
            lhs.recentlyPlayed == rhs.recentlyPlayed &&
            lhs.memberSince == rhs.memberSince &&
            lhs.lastActivity == rhs.lastActivity &&
            lhs.richPresenceMsg == rhs.richPresenceMsg &&
            lhs.lastGameID == rhs.lastGameID &&
            lhs.lastGame == rhs.lastGame &&
            lhs.contribCount == rhs.contribCount &&
            lhs.contribYield == rhs.contribYield &&
            lhs.totalPoints == rhs.totalPoints &&
            lhs.totalTruePoints == rhs.totalTruePoints &&
            lhs.permissions == rhs.permissions &&
            lhs.untracked == rhs.untracked &&
            lhs.id == rhs.id &&
            lhs.userWallActive == rhs.userWallActive &&
            lhs.motto == rhs.motto &&
            lhs.rank == rhs.rank &&
            lhs.awarded == rhs.awarded &&
            lhs.recentAchievements == rhs.recentAchievements &&
            lhs.points == rhs.points &&
            lhs.userPic == rhs.userPic &&
            lhs.totalRanked == rhs.totalRanked &&
            lhs.status == rhs.status
    }
}

// MARK: - Awarded
public struct Awarded_DTO: Codable, Equatable {
    public init(numPossibleAchievements: PHPHelper.JSONIntOrString? = nil, possibleScore: PHPHelper.JSONIntOrString? = nil, numAchieved: PHPHelper.JSONIntOrString? = nil, scoreAchieved: PHPHelper.JSONIntOrString? = nil, numAchievedHardcore: PHPHelper.JSONIntOrString? = nil, scoreAchievedHardcore: PHPHelper.JSONIntOrString? = nil) {
        self.numPossibleAchievements = numPossibleAchievements
        self.possibleScore = possibleScore
        self.numAchieved = numAchieved
        self.scoreAchieved = scoreAchieved
        self.numAchievedHardcore = numAchievedHardcore
        self.scoreAchievedHardcore = scoreAchievedHardcore
    }
    
    public var numPossibleAchievements, possibleScore: PHPHelper.JSONIntOrString?
    public var numAchieved, scoreAchieved: PHPHelper.JSONIntOrString?
    public var numAchievedHardcore, scoreAchievedHardcore: PHPHelper.JSONIntOrString?
    
    enum CodingKeys: String, CodingKey {
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
        case numAchievedHardcore = "NumAchievedHardcore"
        case scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
    
    public static func == (lhs: Awarded_DTO, rhs: Awarded_DTO) -> Bool {
        return lhs.numPossibleAchievements == rhs.numPossibleAchievements &&
            lhs.possibleScore == rhs.possibleScore &&
            lhs.numAchieved == rhs.numAchieved &&
            lhs.scoreAchieved == rhs.scoreAchieved &&
            lhs.numAchievedHardcore == rhs.numAchievedHardcore &&
            lhs.scoreAchievedHardcore == rhs.scoreAchievedHardcore
    }
}

// MARK: - LastActivity
public struct LastActivity_DTO: Codable, Equatable {
    public init(id: String? = nil, timestamp: String? = nil, lastupdate: String? = nil, activitytype: String? = nil, user: String? = nil, data: String? = nil, data2: String? = nil) {
        self.id = id
        self.timestamp = timestamp
        self.lastupdate = lastupdate
        self.activitytype = activitytype
        self.user = user
        self.data = data
        self.data2 = data2
    }
    
    public var id, timestamp, lastupdate, activitytype: String?
    public var user: String?
    public var data, data2: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case timestamp, lastupdate, activitytype
        case user = "User"
        case data, data2
    }
    
    public static func == (lhs: LastActivity_DTO, rhs: LastActivity_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.timestamp == rhs.timestamp &&
            lhs.lastupdate == rhs.lastupdate &&
            lhs.activitytype == rhs.activitytype &&
            lhs.user == rhs.user &&
            lhs.data == rhs.data &&
            lhs.data2 == rhs.data2
    }
}

// MARK: - LastGame
public struct LastGame_DTO: Codable, Equatable {
    public init(id: Int? = nil, title: String? = nil, consoleID: Int? = nil, forumTopicID: Int? = nil, flags: Int? = nil, imageIcon: String? = nil, imageTitle: String? = nil, imageIngame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, released: String? = nil, isFinal: Bool? = nil, consoleName: String? = nil, richPresencePatch: String? = nil) {
        self.id = id
        self.title = title
        self.consoleID = consoleID
        self.forumTopicID = forumTopicID
        self.flags = flags
        self.imageIcon = imageIcon
        self.imageTitle = imageTitle
        self.imageIngame = imageIngame
        self.imageBoxArt = imageBoxArt
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self.released = released
        self.isFinal = isFinal
        self.consoleName = consoleName
        self.richPresencePatch = richPresencePatch
    }
    
    public var id: Int?
    public var title: String?
    public var consoleID, forumTopicID, flags: Int?
    public var imageIcon, imageTitle, imageIngame, imageBoxArt: String?
    public var publisher, developer, genre, released: String?
    public var isFinal: Bool?
    public var consoleName, richPresencePatch: String?
    
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
    
    public static func == (lhs: LastGame_DTO, rhs: LastGame_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.consoleID == rhs.consoleID &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.imageTitle == rhs.imageTitle &&
            lhs.imageIngame == rhs.imageIngame &&
            lhs.imageBoxArt == rhs.imageBoxArt &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs.released == rhs.released &&
            lhs.isFinal == rhs.isFinal &&
            lhs.consoleName == rhs.consoleName &&
            lhs.richPresencePatch == rhs.richPresencePatch
    }
}

// MARK: - RecentAchievement
public struct RecentAchievement_DTO: Codable, Equatable {
    public init(id: String? = nil, gameID: String? = nil, gameTitle: String? = nil, title: String? = nil, recentAchievementDescription: String? = nil, points: String? = nil, badgeName: String? = nil, isAwarded: String? = nil, dateAwarded: String? = nil, hardcoreAchieved: String? = nil) {
        self.id = id
        self.gameID = gameID
        self.gameTitle = gameTitle
        self.title = title
        self.recentAchievementDescription = recentAchievementDescription
        self.points = points
        self.badgeName = badgeName
        self.isAwarded = isAwarded
        self.dateAwarded = dateAwarded
        self.hardcoreAchieved = hardcoreAchieved
    }
    
    public var id, gameID, gameTitle, title: String?
    public var recentAchievementDescription, points, badgeName, isAwarded: String?
    public var dateAwarded, hardcoreAchieved: String?
    
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
    
    public static func == (lhs: RecentAchievement_DTO, rhs: RecentAchievement_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.gameID == rhs.gameID &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.title == rhs.title &&
            lhs.recentAchievementDescription == rhs.recentAchievementDescription &&
            lhs.points == rhs.points &&
            lhs.badgeName == rhs.badgeName &&
            lhs.isAwarded == rhs.isAwarded &&
            lhs.dateAwarded == rhs.dateAwarded &&
            lhs.hardcoreAchieved == rhs.hardcoreAchieved
    }
}

// MARK: - RecentlyPlayed
public struct RecentlyPlayed_DTO: Codable, Equatable {
    public init(gameID: String? = nil, consoleID: String? = nil, consoleName: String? = nil, title: String? = nil, imageIcon: String? = nil, lastPlayed: String? = nil, myVote: String? = nil) {
        self.gameID = gameID
        self.consoleID = consoleID
        self.consoleName = consoleName
        self.title = title
        self.imageIcon = imageIcon
        self.lastPlayed = lastPlayed
        self.myVote = myVote
    }
    
    public var gameID, consoleID, consoleName, title: String?
    public var imageIcon, lastPlayed: String?
    public var myVote: String? //FIXME: type mismatch
    
    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case title = "Title"
        case imageIcon = "ImageIcon"
        case lastPlayed = "LastPlayed"
        case myVote = "MyVote"
    }
    
    public static func == (lhs: RecentlyPlayed_DTO, rhs: RecentlyPlayed_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.consoleID == rhs.consoleID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.title == rhs.title &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.lastPlayed == rhs.lastPlayed &&
            lhs.myVote == rhs.myVote
    }
}
