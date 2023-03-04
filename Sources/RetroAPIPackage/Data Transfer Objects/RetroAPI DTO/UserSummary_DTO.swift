// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(recentlyPlayedCount: Int = 0, recentlyPlayed: [UserSummary_DTO.Game_DTO] = [], lastActivity: UserSummary_DTO.LastActivity_DTO? = nil, richPresenceMsg: String? = nil, lastGameID: Int? = nil, lastGame: UserSummary_DTO.LastGame_DTO? = nil, contribCount: Int = 0, contribYield: Int = 0, totalPoints: Int = 0, totalSoftcorePoints: Int = 0, totalTruePoints: Int = 0, permissions: Int = 0, untracked: Int = 0, _id: Int = 0, userWallActive: Int = 0, motto: String = "", rank: Int? = nil, awarded: UserProgress_DTO? = nil, totalRanked: Int = 0, status: String = "", _memberSince: String = "", _userPic: String = "", _recentAchievements: [String : [String : UserSummary_DTO.Achievement_DTO]]? = nil) {
        self.recentlyPlayedCount = recentlyPlayedCount
        self.recentlyPlayed = recentlyPlayed
        self.lastActivity = lastActivity
        self.richPresenceMsg = richPresenceMsg
        self.lastGameID = lastGameID
        self.lastGame = lastGame
        self.contribCount = contribCount
        self.contribYield = contribYield
        self.totalPoints = totalPoints
        self.totalSoftcorePoints = totalSoftcorePoints
        self.totalTruePoints = totalTruePoints
        self.permissions = permissions
        self.untracked = untracked
        self._id = _id
        self.userWallActive = userWallActive
        self.motto = motto
        self.rank = rank
        self.awarded = awarded
        self.totalRanked = totalRanked
        self.status = status
        self._memberSince = _memberSince
        self._userPic = _userPic
        self._recentAchievements = _recentAchievements
    }

    public var recentlyPlayedCount: Int
    public var recentlyPlayed: [UserSummary_DTO.Game_DTO]
    public var lastActivity: LastActivity_DTO?
    public var richPresenceMsg: String?
    public var lastGameID:Int?
    public var lastGame: UserSummary_DTO.LastGame_DTO?
    public var contribCount, contribYield, totalPoints, totalSoftcorePoints: Int
    public var totalTruePoints, permissions, untracked: Int
    private var _id: Int
    public var userWallActive: Int
    public var motto: String
    public var rank: Int?
    public var awarded: UserProgress_DTO?
    public var totalRanked:Int
    public var status: String
    
    private var _memberSince: String //to date
    private var _userPic:String //to url
    private var _recentAchievements: [String:[String:UserSummary_DTO.Achievement_DTO]]?
    
    public var memberSince: Date? {
        DateFormatter.date(fromString: self._memberSince)
    }
    
    public var points:Int {
        get { return totalPoints } 
    }
  
    public var userID:Int {
        get { return _id }
        set { _id = newValue }
    }
    
    public var userPicURL: URL? {
        return URL(string: RetroAPI.baseImageURL + _userPic)
    }
    
    public var achievements:[UserSummary_DTO.Achievement_DTO] {
        if let recentAchievements = _recentAchievements {
            return recentAchievements.values.map({ $0.values }).reduce([], +)
        } else {
            return []
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case recentlyPlayedCount = "RecentlyPlayedCount"
        case recentlyPlayed = "RecentlyPlayed"
        case _memberSince = "MemberSince"
        case lastActivity = "LastActivity"
        case richPresenceMsg = "RichPresenceMsg"
        case lastGameID = "LastGameID"
        case lastGame = "LastGame"
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
        case awarded = "Awarded"
        case _recentAchievements = "RecentAchievements"
        case _userPic = "UserPic"
        case totalRanked = "TotalRanked"
        case status = "Status"
    }
    
}

public extension UserSummary_DTO {
    
    // MARK: - LastActivity
    struct LastActivity_DTO: Codable, Equatable {
        public init(id:Int = 0, activitytype: Int = 0, _timestamp: String = "", _lastupdate: String = "", user: String = "", data: String? = nil, data2: String? = nil) {
            self.id = id
            self.activitytype = activitytype
            self._timestamp = _timestamp
            self._lastupdate = _lastupdate
            self.user = user
            self.data = data
            self.data2 = data2
        }
        

        public var id, activitytype: Int
        private var _timestamp, _lastupdate: String
        
        public var user: String
        public var data, data2: String?

        public var timestamp: Date? {
            DateFormatter.date(fromString: self._timestamp)
        }
        
        public var lastupdate: Date? {
            DateFormatter.date(fromString: self._lastupdate)
        }

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case _timestamp = "timestamp"
            case _lastupdate = "lastupdate"
            case activitytype = "activitytype"
            case user = "User"
            case data, data2
        }
        
        public static func == (lhs: UserSummary_DTO.LastActivity_DTO, rhs: UserSummary_DTO.LastActivity_DTO) -> Bool {
            return lhs.id == rhs.id &&
                lhs.activitytype == rhs.activitytype &&
                lhs.timestamp == rhs.timestamp &&
                lhs.lastupdate == rhs.lastupdate &&
                lhs.user == rhs.user &&
                lhs.data == rhs.data &&
                lhs.data2 == rhs.data2
        }
    }
}
