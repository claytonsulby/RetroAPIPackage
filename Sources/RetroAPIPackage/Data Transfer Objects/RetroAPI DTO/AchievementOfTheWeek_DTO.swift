// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementOfTheWeek_DTO: Codable, Equatable {
    public init(achievement: AchievementOfTheWeek_DTO.Achievement_DTO? = nil, console: Console_DTO? = nil, forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO? = nil, game: AchievementOfTheWeek_DTO.Game_DTO? = nil, startAt: String? = nil, _totalPlayers:StringMapTo<Int> = StringMapTo(0), unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]? = nil, _unlocksCount:StringMapTo<Int> = StringMapTo(0)) {
        self.achievement = achievement
        self.console = console
        self.forumTopic = forumTopic
        self.game = game
        self.startAt = startAt
        self._totalPlayers = _totalPlayers
        self.unlocks = unlocks
        self._unlocksCount = _unlocksCount
    }
    
    private var _totalPlayers:StringMapTo<Int>
    public var _unlocksCount:StringMapTo<Int>
    
    public var achievement: AchievementOfTheWeek_DTO.Achievement_DTO?
    public var console: Console_DTO?
    public var forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO?
    public var game: AchievementOfTheWeek_DTO.Game_DTO?
    public var startAt: String?
    public var unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]?
    
    
    public var totalPlayers: Int {
        get { return _totalPlayers.decoded }
        set { _totalPlayers.decoded = newValue }
    }
    
    public var unlocksCount: Int {
        get { return _unlocksCount.decoded }
        set { _unlocksCount.decoded = newValue }
    }
    
    
    enum CodingKeys: String, CodingKey {
        case achievement = "Achievement"
        case console = "Console"
        case forumTopic = "ForumTopic"
        case game = "Game"
        case startAt = "StartAt"
        case _totalPlayers = "TotalPlayers"
        case unlocks = "Unlocks"
        case _unlocksCount = "UnlocksCount"
    }
    
    public static func == (lhs: AchievementOfTheWeek_DTO, rhs: AchievementOfTheWeek_DTO) -> Bool {
        return lhs._totalPlayers == rhs._totalPlayers &&
        lhs._unlocksCount == rhs._unlocksCount &&
        lhs.achievement == rhs.achievement &&
        lhs.console == rhs.console &&
        lhs.forumTopic == rhs.forumTopic &&
        lhs.game == rhs.game &&
        lhs.startAt == rhs.startAt &&
        lhs.unlocks == rhs.unlocks
    }
}

public extension AchievementOfTheWeek_DTO {
    
    // MARK: - ForumTopic
    struct ForumTopic_DTO: Codable, Equatable {
        public var id: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.ForumTopic_DTO, rhs: AchievementOfTheWeek_DTO.ForumTopic_DTO) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    // MARK: - Unlock
    struct Unlock_DTO: Codable, Equatable {
        public var user, raPoints, dateAwarded, hardcoreMode: String?
        
        enum CodingKeys: String, CodingKey {
            case user = "User"
            case raPoints = "RAPoints"
            case dateAwarded = "DateAwarded"
            case hardcoreMode = "HardcoreMode"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Unlock_DTO, rhs: AchievementOfTheWeek_DTO.Unlock_DTO) -> Bool {
            return lhs.user == rhs.user &&
            lhs.raPoints == rhs.raPoints &&
            lhs.dateAwarded == rhs.dateAwarded &&
            lhs.hardcoreMode == rhs.hardcoreMode
        }
    }
    
}
