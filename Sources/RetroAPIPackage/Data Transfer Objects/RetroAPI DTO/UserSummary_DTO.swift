// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(recentlyPlayedCount: Int? = nil, recentlyPlayed: [UserSummary_DTO.Game_DTO]? = nil, memberSince: String? = nil, lastActivity: UserSummary_DTO.LastActivity_DTO? = nil, richPresenceMsg: String? = nil, lastGameID: String? = nil, lastGame: GameExtended_DTO? = nil, contribCount: PHPHelper.JSONPrimitiveType? = nil, contribYield: PHPHelper.JSONPrimitiveType? = nil, totalPoints: PHPHelper.JSONPrimitiveType? = nil, totalTruePoints: PHPHelper.JSONPrimitiveType? = nil, permissions: String? = nil, untracked: String? = nil, id: String? = nil, userWallActive: String? = nil, motto: String? = nil, rank: Int? = nil, awarded: [String : UserProgress_DTO]? = nil, recentAchievements: [String:[String:UserSummary_DTO.Achievement_DTO]]? = nil, points: String? = nil, userPic: String? = nil, totalRanked: String? = nil, status: String? = nil) {
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
    public var recentlyPlayed: [UserSummary_DTO.Game_DTO]?
    public var memberSince: String?
    public var lastActivity: LastActivity_DTO?
    public var richPresenceMsg, lastGameID: String?
    public var lastGame: GameExtended_DTO?
    public var contribCount, contribYield, totalPoints, totalTruePoints: PHPHelper.JSONPrimitiveType?
    public var permissions, untracked, id, userWallActive: String?
    public var motto: String?
    public var rank: Int?
    public var awarded: [String: UserProgress_DTO]?
    public var recentAchievements: [String:[String:UserSummary_DTO.Achievement_DTO]]?
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
}
