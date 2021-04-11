// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementOfTheWeek_DTO: Codable, Equatable {
    public init(achievement: Achievement_DTO? = nil, console: Console_DTO? = nil, forumTopic: ForumTopic_DTO? = nil, game: Console_DTO? = nil, startAt: String? = nil, totalPlayers: Int? = nil, unlocks: [Unlock_DTO]? = nil, unlocksCount: Int? = nil) {
        self.achievement = achievement
        self.console = console
        self.forumTopic = forumTopic
        self.game = game
        self.startAt = startAt
        self.totalPlayers = totalPlayers
        self.unlocks = unlocks
        self.unlocksCount = unlocksCount
    }
    
    public var achievement: Achievement_DTO?
    public var console: Console_DTO?
    public var forumTopic: ForumTopic_DTO?
    public var game: Console_DTO?
    public var startAt: String?
    public var totalPlayers: Int?
    public var unlocks: [Unlock_DTO]?
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
    
    public static func == (lhs: AchievementOfTheWeek_DTO, rhs: AchievementOfTheWeek_DTO) -> Bool {
        return lhs.achievement == rhs.achievement &&
            lhs.console == rhs.console &&
            lhs.forumTopic == rhs.forumTopic &&
            lhs.game == rhs.game &&
            lhs.startAt == rhs.startAt &&
            lhs.totalPlayers == rhs.totalPlayers &&
            lhs.unlocks == rhs.unlocks &&
            lhs.unlocksCount == rhs.unlocksCount
    }
}

// MARK: - ForumTopic
public struct ForumTopic_DTO: Codable, Equatable {
    public init(id: String? = nil) {
        self.id = id
    }
    
    public var id: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
    }
    
    public static func == (lhs: ForumTopic_DTO, rhs: ForumTopic_DTO) -> Bool {
        return lhs.id == rhs.id
    }
}
