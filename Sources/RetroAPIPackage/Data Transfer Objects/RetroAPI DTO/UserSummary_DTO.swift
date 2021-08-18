// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(recentlyPlayedCount: Int? = nil, recentlyPlayed: [UserSummary_DTO.RecentlyPlayed_DTO]? = nil, memberSince: String? = nil, lastActivity: UserSummary_DTO.LastActivity_DTO? = nil, richPresenceMsg: String? = nil, lastGameID: String? = nil, lastGame: GameExtended_DTO? = nil, contribCount: PHPHelper.JSONPrimitiveType? = nil, contribYield: PHPHelper.JSONPrimitiveType? = nil, totalPoints: PHPHelper.JSONPrimitiveType? = nil, totalTruePoints: PHPHelper.JSONPrimitiveType? = nil, permissions: String? = nil, untracked: String? = nil, id: String? = nil, userWallActive: String? = nil, motto: String? = nil, rank: Int? = nil, awarded: [String : UserProgress_DTO]? = nil, recentAchievements: PHPHelper.AchievementMapper? = nil, points: String? = nil, userPic: String? = nil, totalRanked: String? = nil, status: String? = nil) {
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
    public var lastGame: GameExtended_DTO?
    public var contribCount, contribYield, totalPoints, totalTruePoints: PHPHelper.JSONPrimitiveType?
    public var permissions, untracked, id, userWallActive: String?
    public var motto: String?
    public var rank: Int?
    public var awarded: [String: UserProgress_DTO]?
    public var recentAchievements: PHPHelper.AchievementMapper?
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

public extension UserSummary_DTO {
    
    // MARK: - RecentAchievement
    public struct Achievement_DTO: Codable, Equatable {
        public init(achievementID: String? = nil, gameID: String? = nil, gameTitle: String? = nil, title: String? = nil, achievementDescription: String? = nil, points: String? = nil, badgeName: String? = nil, isAwarded: String? = nil, dateAwarded: String? = nil, hardcoreAchieved: String? = nil) {
            self.achievementID = achievementID
            self.gameID = gameID
            self.gameTitle = gameTitle
            self.title = title
            self.achievementDescription = achievementDescription
            self.points = points
            self.badgeName = badgeName
            self.isAwarded = isAwarded
            self.dateAwarded = dateAwarded
            self.hardcoreAchieved = hardcoreAchieved
        }
        
        public var achievementID, gameID, gameTitle, title: String?
        public var achievementDescription, points, badgeName, isAwarded: String?
        public var dateAwarded, hardcoreAchieved: String?

        enum CodingKeys: String, CodingKey {
            case achievementID = "ID"
            case gameID = "GameID"
            case gameTitle = "GameTitle"
            case title = "Title"
            case achievementDescription = "Description"
            case points = "Points"
            case badgeName = "BadgeName"
            case isAwarded = "IsAwarded"
            case dateAwarded = "DateAwarded"
            case hardcoreAchieved = "HardcoreAchieved"
        }
        
        public static func == (lhs: UserSummary_DTO.Achievement_DTO, rhs: UserSummary_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
                lhs.gameID == rhs.gameID &&
                lhs.gameTitle == rhs.gameTitle &&
                lhs.title == rhs.title &&
                lhs.achievementDescription == rhs.achievementDescription &&
                lhs.points == rhs.points &&
                lhs.badgeName == rhs.badgeName &&
                lhs.isAwarded == rhs.isAwarded &&
                lhs.dateAwarded == rhs.dateAwarded &&
                lhs.hardcoreAchieved == rhs.hardcoreAchieved
        }
    }
    
}

public extension UserSummary_DTO {
    
    // MARK: - LastActivity
    struct LastActivity_DTO: Codable, Equatable {
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
    
    // MARK: - RecentlyPlayed
    struct RecentlyPlayed_DTO: Codable, Equatable {
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
    
}




