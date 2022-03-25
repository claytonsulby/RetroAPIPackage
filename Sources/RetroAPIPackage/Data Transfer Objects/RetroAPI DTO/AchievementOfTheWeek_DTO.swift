// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementOfTheWeek_DTO: Codable {
    public init(achievement: AchievementOfTheWeek_DTO.Achievement_DTO? = nil, console: Console_DTO? = nil, forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO? = nil, game: AchievementOfTheWeek_DTO.Game_DTO? = nil, startAt: String? = nil, totalPlayers: Int? = nil, unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]? = nil, unlocksCount: Int? = nil) {
        self.achievement = achievement
        self.console = console
        self.forumTopic = forumTopic
        self.game = game
        self.startAt = startAt
        self.totalPlayers = totalPlayers
        self.unlocks = unlocks
        self.unlocksCount = unlocksCount
    }
    
    public var achievement: AchievementOfTheWeek_DTO.Achievement_DTO?
    public var console: Console_DTO?
    public var forumTopic: AchievementOfTheWeek_DTO.ForumTopic_DTO?
    public var game: AchievementOfTheWeek_DTO.Game_DTO?
    public var startAt: String?
    public var totalPlayers: Int?
    public var unlocks: [AchievementOfTheWeek_DTO.Unlock_DTO]?
    public var unlocksCount: Int?
    
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
}

public extension AchievementOfTheWeek_DTO {
    
    // MARK: - ForumTopic
    struct ForumTopic_DTO: Codable {
        public var id: String?
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
        }
    }
    
    // MARK: - Unlock
    struct Unlock_DTO: Codable {
        public var user, raPoints, dateAwarded, hardcoreMode: String?
        
        enum CodingKeys: String, CodingKey {
            case user = "User"
            case raPoints = "RAPoints"
            case dateAwarded = "DateAwarded"
            case hardcoreMode = "HardcoreMode"
        }
    }
    
}
