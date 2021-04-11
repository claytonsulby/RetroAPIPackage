// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementOfTheWeek_DTO: Codable {
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
}

// MARK: - ForumTopic
public struct ForumTopic_DTO: Codable {
    public var id: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
    }
}
