// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(user: String = "",
                lastActivity: UserSummary_DTO.LastActivity_DTO? = nil,
                richPresenceMsg: String? = nil,
                lastGameID: Int = 0,
                contribCount: Int = 0,
                contribYield: Int = 0,
                totalPoints: Int = 0,
                totalSoftcorePoints: Int = 0,
                totalTruePoints: Int = 0,
                permissions: Int = 0,
                untracked: Int = 0,
                userWallActive: Int = 0,
                motto: String = "",
                rank: Int? = nil,
                recentlyPlayedCount: Int = 0,
                recentlyPlayed: [UserSummary_DTO.Game_DTO] = [],
                awarded: [String : UserProgressElement_DTO]? = nil,
                lastGame: UserSummary_DTO.LastGame_DTO? = nil,
                totalRanked: Int = 0,
                status: String = "",
                _memberSince: String = "",
                _id: Int = 0,
                _userPic: String = "",
                _recentAchievements: DecodeNilUnless<[String: [String: UserSummary_DTO.Achievement_DTO]]>? = nil) {
        self.user = user
        self.lastActivity = lastActivity
        self.richPresenceMsg = richPresenceMsg
        self.lastGameID = lastGameID
        self.contribCount = contribCount
        self.contribYield = contribYield
        self.totalPoints = totalPoints
        self.totalSoftcorePoints = totalSoftcorePoints
        self.totalTruePoints = totalTruePoints
        self.permissions = permissions
        self.untracked = untracked
        self.userWallActive = userWallActive
        self.motto = motto
        self.rank = rank
        self.recentlyPlayedCount = recentlyPlayedCount
        self.recentlyPlayed = recentlyPlayed
        self.awarded = awarded
        self.lastGame = lastGame
        self.totalRanked = totalRanked
        self.status = status
        self._memberSince = _memberSince
        self._id = _id
        self._userPic = _userPic
        self._recentAchievements = _recentAchievements
    }
    
    public let user: String
    private let _memberSince: String
    public let lastActivity: LastActivity_DTO?
    public let richPresenceMsg: String?
    public let lastGameID, contribCount, contribYield, totalPoints: Int
    public let totalSoftcorePoints, totalTruePoints, permissions, untracked: Int
    private let _id: Int
    public let userWallActive: Int
    public let motto: String?
    public let rank: Int?
    public let recentlyPlayedCount: Int
    public let recentlyPlayed: [UserSummary_DTO.Game_DTO]
    public let awarded: [String: UserProgressElement_DTO]?
    private let _recentAchievements: DecodeNilUnless<[String: [String: UserSummary_DTO.Achievement_DTO]]>?
    public let lastGame: UserSummary_DTO.LastGame_DTO?
    private let _userPic:String
    public let totalRanked: Int
    public let status: String
    
    enum CodingKeys: String, CodingKey {
        case user = "User"
        case _memberSince = "MemberSince"
        case lastActivity = "LastActivity"
        case richPresenceMsg = "RichPresenceMsg"
        case lastGameID = "LastGameID"
        case contribCount = "ContribCount"
        case contribYield = "ContribYield"
        case totalPoints = "TotalPoints"
        case totalSoftcorePoints = "TotalSoftcorePoints"
        case totalTruePoints = "TotalTruePoints"
        case permissions = "Permissions"
        case untracked = "Untracked"
        case _id = "ID"
        case userWallActive = "UserWallActive"
        case motto = "Motto"
        case rank = "Rank"
        case recentlyPlayedCount = "RecentlyPlayedCount"
        case recentlyPlayed = "RecentlyPlayed"
        case awarded = "Awarded"
        case _recentAchievements = "RecentAchievements"
        case lastGame = "LastGame"
        case _userPic = "UserPic"
        case totalRanked = "TotalRanked"
        case status = "Status"
    }
    
    public var memberSince: Date? {
        DateFormatter.date(fromString: self._memberSince)
    }
    
    public var points:Int {
        get { return totalPoints }
    }
    
    public var userID:Int {
        get { return _id }
    }
    
    public var userPicURL: URL? {
        return URL(string: RetroAPI.baseImageURL + _userPic)
    }
    
    public var achievements:[UserSummary_DTO.Achievement_DTO] {
        if let recentAchievements = _recentAchievements?.decoded {
            return recentAchievements.values.map({ $0.values }).reduce([], +)
        } else {
            return []
        }
    }
    
}

public extension UserSummary_DTO {

    // MARK: - LastActivity
    struct LastActivity_DTO: Codable, Equatable {
        public let id: Int
        public let timestamp, lastupdate: String?
        public let activitytype: String?
        public let user: String
        public let data, data2: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case timestamp, lastupdate, activitytype
            case user = "User"
            case data, data2
        }
    }
}
