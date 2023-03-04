// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementOfTheWeek_DTO: Codable, Equatable {
    public init(achievement: AchievementOfTheWeek_DTO.Achievement_DTO? = nil, console: Console_DTO? = nil, forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO? = nil, game: AchievementOfTheWeek_DTO.Game_DTO? = nil, startAt: String? = nil, totalPlayers:Int = 0, unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]? = nil, unlocksCount:Int = 0) {
        self.achievement = achievement
        self.console = console
        self.forumTopic = forumTopic
        self.game = game
        self.startAt = startAt
        self.totalPlayers = totalPlayers
        self.unlocks = unlocks
        self.unlocksCount = unlocksCount
    }
    
    public var totalPlayers:Int
    public var unlocksCount:Int
    
    public var achievement: AchievementOfTheWeek_DTO.Achievement_DTO?
    public var console: Console_DTO?
    public var forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO?
    public var game: AchievementOfTheWeek_DTO.Game_DTO?
    public var startAt: String?
    public var unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]?
    
    enum CodingKeys: String, CodingKey {
        case achievement = "Achievement"
        case console = "Console"
        case forumTopic = "ForumTopic"
        case game = "Game"
        case startAt = "StartAt"
        case totalPlayers = "TotalPlayers"
        case unlocks = "Unlocks"
        case unlocksCount = "UnlocksCount"
    }
    
    public static func == (lhs: AchievementOfTheWeek_DTO, rhs: AchievementOfTheWeek_DTO) -> Bool {
        return lhs.totalPlayers == rhs.totalPlayers &&
        lhs.unlocksCount == rhs.unlocksCount &&
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
        public var id: Int?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.ForumTopic_DTO, rhs: AchievementOfTheWeek_DTO.ForumTopic_DTO) -> Bool {
            return lhs.id == rhs.id
        }
    }
    
    // MARK: - Unlock
    struct Unlock_DTO: Codable, Equatable {
        public var user, dateAwarded: String?
        public var hardcoreMode, raPoints: Int?
        
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
