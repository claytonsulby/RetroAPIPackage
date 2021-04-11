// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementUnlocks_DTO: Codable, Equatable {
    public init(achievement: Achievement_DTO? = nil, console: Console_DTO? = nil, game: Console_DTO? = nil, unlocksCount: Int? = nil, totalPlayers: Int? = nil, unlocks: [Unlock_DTO]? = nil) {
        self.achievement = achievement
        self.console = console
        self.game = game
        self.unlocksCount = unlocksCount
        self.totalPlayers = totalPlayers
        self.unlocks = unlocks
    }
    
    public var achievement: Achievement_DTO?
    public var console, game: Console_DTO?
    public var unlocksCount, totalPlayers: Int?
    public var unlocks: [Unlock_DTO]?

    enum CodingKeys: String, CodingKey {
        case achievement = "Achievement"
        case console = "Console"
        case game = "Game"
        case unlocksCount = "UnlocksCount"
        case totalPlayers = "TotalPlayers"
        case unlocks = "Unlocks"
    }
    
    public static func == (lhs: AchievementUnlocks_DTO, rhs: AchievementUnlocks_DTO) -> Bool {
        return lhs.achievement == rhs.achievement &&
            lhs.console == rhs.console &&
            lhs.game == rhs.game &&
            lhs.unlocksCount == rhs.unlocksCount &&
            lhs.totalPlayers == rhs.totalPlayers &&
            lhs.unlocks == rhs.unlocks
    }
}

// MARK: - Unlock
public struct Unlock_DTO: Codable, Equatable {
    public init(user: String? = nil, raPoints: String? = nil, dateAwarded: String? = nil, hardcoreMode: String? = nil) {
        self.user = user
        self.raPoints = raPoints
        self.dateAwarded = dateAwarded
        self.hardcoreMode = hardcoreMode
    }
    
    public var user, raPoints, dateAwarded, hardcoreMode: String?

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case raPoints = "RAPoints"
        case dateAwarded = "DateAwarded"
        case hardcoreMode = "HardcoreMode"
    }
    
    public static func == (lhs: Unlock_DTO, rhs: Unlock_DTO) -> Bool {
        return lhs.user == rhs.user &&
            lhs.raPoints == rhs.raPoints &&
            lhs.dateAwarded == rhs.dateAwarded &&
            lhs.hardcoreMode == rhs.hardcoreMode
    }
}
