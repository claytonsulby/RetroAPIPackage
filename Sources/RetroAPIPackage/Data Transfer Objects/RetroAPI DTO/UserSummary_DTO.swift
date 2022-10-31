// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let userSummary = try? JSONDecoder().decode(UserSummary.self, from: jsonData)

import Foundation

// MARK: - UserSummary
public struct UserSummary_DTO: Codable, Equatable {
    public init(recentlyPlayedCount: Int = 0, recentlyPlayed: [UserSummary_DTO.Game_DTO] = [], lastActivity: UserSummary_DTO.LastActivity_DTO? = nil, richPresenceMsg: String? = nil, lastGame: UserSummary_DTO.LastGame_DTO? = nil, motto: String = "", rank: Int = 0, awarded: UserProgress_DTO? = nil, status: String = "", _contribCount: StringMapTo<Int> = StringMapTo(0), _contribYield: StringMapTo<Int> = StringMapTo(0), _totalPoints: StringMapTo<Int> = StringMapTo(0), _lastGameID: StringMapTo<Int> = StringMapTo(0), _totalTruePoints: String? = nil, _memberSince: String = "", _permissions: StringMapTo<Int> = StringMapTo(0), _untracked: StringMapTo<Int> = StringMapTo(0), _id: StringMapTo<Int> = StringMapTo(0), _userWallActive: StringMapTo<Int> = StringMapTo(0), _points: StringMapTo<Int> = StringMapTo(0), totalRanked:Int = 0, _userPic: String = "", _recentAchievements: [String : [String : UserSummary_DTO.Achievement_DTO]]? = nil) {
        self.recentlyPlayedCount = recentlyPlayedCount
        self.recentlyPlayed = recentlyPlayed
        self.lastActivity = lastActivity
        self.richPresenceMsg = richPresenceMsg
        self.lastGame = lastGame
        self.motto = motto
        self.rank = rank
        self.awarded = awarded
        self.status = status
        self._contribCount = _contribCount
        self._contribYield = _contribYield
        self._totalPoints = _totalPoints
        self._lastGameID = _lastGameID
        self._totalTruePoints = _totalTruePoints
        self._memberSince = _memberSince
        self._permissions = _permissions
        self._untracked = _untracked
        self._id = _id
        self._userWallActive = _userWallActive
        self._points = _points
        self.totalRanked = totalRanked
        self._userPic = _userPic
        self._recentAchievements = _recentAchievements
    }
    
    
    public var recentlyPlayedCount: Int
    public var recentlyPlayed: [UserSummary_DTO.Game_DTO]
    public var lastActivity: LastActivity_DTO?
    public var richPresenceMsg: String?
    public var lastGame: UserSummary_DTO.LastGame_DTO?
    public var motto: String
    public var rank: Int
    public var awarded: UserProgress_DTO?
    public var status: String
    public var totalRanked:Int
    
    private var _contribCount, _contribYield, _totalPoints, _lastGameID:StringMapTo<Int>
    private var _totalTruePoints: String?
    private var _memberSince: String //to date
    private var _permissions, _untracked, _id, _userWallActive, _points: StringMapTo<Int>
    private var _userPic:String //to url
    private var _recentAchievements: [String:[String:UserSummary_DTO.Achievement_DTO]]?

    public var contribCount:Int {
        get { return _contribCount.decoded }
        set { _contribCount.decoded = newValue }
    }
    
    public var contribYield:Int {
        get { return _contribYield.decoded }
        set { _contribYield.decoded = newValue }
    }
    
    public var totalPoints:Int {
        get { return _totalPoints.decoded }
        set { _totalPoints.decoded = newValue }
    }
    
    //"0" if nothing
    public var lastGameID:Int? {
        get {
            if _lastGameID.decoded != 0 {
                return _lastGameID.decoded
            } else {
                return nil
            }
        }
        set { _lastGameID.decoded = newValue ?? 0 }
    }
    
    public var totalTruePoints:Int? {
        get {
            if let totalTruePoints = _totalTruePoints {
                return Int(totalTruePoints)
            } else {
                return nil
            }
        }
        set { _lastGameID.decoded = newValue ?? 0 }
    }
    
    public var memberSince: Date? {
        DateFormatter.date(fromString: self._memberSince)
    }
    
    public var permissions:Int {
        get { return _permissions.decoded }
        set { _permissions.decoded = newValue }
    }
    public var untracked:Int {
        get { return _untracked.decoded }
        set { _untracked.decoded = newValue }
    }
    public var userID:Int {
        get { return _id.decoded }
        set { _id.decoded = newValue }
    }
    public var userWallActive:Int {
        get { return _userWallActive.decoded }
        set { _userWallActive.decoded = newValue }
    }
    public var points:Int {
        get { return _points.decoded }
        set { _points.decoded = newValue }
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
        case _lastGameID = "LastGameID"
        case lastGame = "LastGame"
        case _contribCount = "ContribCount"
        case _contribYield = "ContribYield"
        case _totalPoints = "TotalPoints"
        case _totalTruePoints = "TotalTruePoints"
        case _permissions = "Permissions"
        case _untracked = "Untracked"
        case _id = "ID"
        case _userWallActive = "UserWallActive"
        case motto = "Motto"
        case rank = "Rank"
        case awarded = "Awarded"
        case _recentAchievements = "RecentAchievements"
        case _points = "Points"
        case _userPic = "UserPic"
        case totalRanked = "TotalRanked"
        case status = "Status"
    }
    
    public static func == (lhs: UserSummary_DTO, rhs: UserSummary_DTO) -> Bool {
        return lhs.recentlyPlayedCount == rhs.recentlyPlayedCount &&
            lhs.recentlyPlayed == rhs.recentlyPlayed &&
            lhs.lastActivity == rhs.lastActivity &&
            lhs.richPresenceMsg == rhs.richPresenceMsg &&
            lhs.lastGame == rhs.lastGame &&
            lhs.motto == rhs.motto &&
            lhs.rank == rhs.rank &&
            lhs.awarded == rhs.awarded &&
            lhs.status == rhs.status &&
            lhs.contribCount == rhs.contribCount &&
            lhs.contribYield == rhs.contribYield &&
            lhs.totalPoints == rhs.totalPoints &&
            lhs.lastGameID == rhs.lastGameID &&
            lhs.totalTruePoints == rhs.totalTruePoints &&
            lhs.memberSince == rhs.memberSince &&
            lhs.permissions == rhs.permissions &&
            lhs.untracked == rhs.untracked &&
//            lhs.id == rhs.id &&
            lhs.userWallActive == rhs.userWallActive &&
            lhs.points == rhs.points &&
            lhs.totalRanked == rhs.totalRanked &&
//            lhs._userPic == rhs._userPic &&
            lhs._recentAchievements == rhs._recentAchievements
    }
}

public extension UserSummary_DTO {
    
    // MARK: - LastActivity
    struct LastActivity_DTO: Codable, Equatable {
        public init(_id: StringMapTo<Int> = StringMapTo(0), _activitytype: StringMapTo<Int> = StringMapTo(0), _timestamp: String = "", _lastupdate: String = "", user: String = "", data: String? = nil, data2: String? = nil) {
            self._id = _id
            self._activitytype = _activitytype
            self._timestamp = _timestamp
            self._lastupdate = _lastupdate
            self.user = user
            self.data = data
            self.data2 = data2
        }
        

        private var _id, _activitytype: StringMapTo<Int>
        private var _timestamp, _lastupdate: String
        
        public var user: String
        public var data, data2: String?
        
        public var id:Int {
            get { return _id.decoded }
            set { _id.decoded = newValue }
        }
        
        public var activitytype:Int {
            get { return _activitytype.decoded }
            set { _activitytype.decoded = newValue }
        }
        
        public var timestamp: Date? {
            DateFormatter.date(fromString: self._timestamp)
        }
        
        public var lastupdate: Date? {
            DateFormatter.date(fromString: self._lastupdate)
        }

        enum CodingKeys: String, CodingKey {
            case _id = "ID"
            case _timestamp = "timestamp"
            case _lastupdate = "lastupdate"
            case _activitytype = "activitytype"
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
