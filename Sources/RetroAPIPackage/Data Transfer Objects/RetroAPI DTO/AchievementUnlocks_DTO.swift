// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementUnlocks_DTO: Codable {
    public init(achievement: AchievementUnlocks_DTO.Achievement_DTO? = nil, console: Console_DTO? = nil, game: AchievementUnlocks_DTO.Game_DTO? = nil, unlocksCount: Int? = nil, totalPlayers: Int? = nil) {//, unlocks: [AchievementUnlocks_DTO.Unlock_DTO]? = nil) {
        self.achievement = achievement
        self.console = console
        self.game = game
        self.unlocksCount = unlocksCount
        self.totalPlayers = totalPlayers
//        self.unlocks = unlocks
    }
    
    public var achievement: AchievementUnlocks_DTO.Achievement_DTO?
    public var console: Console_DTO?
    public var game: AchievementUnlocks_DTO.Game_DTO?
    public var unlocksCount, totalPlayers: Int?
//    public var unlocks: [AchievementUnlocks_DTO.Unlock_DTO]?

    enum CodingKeys: String, CodingKey {
        case achievement = "Achievement"
        case console = "Console"
        case game = "Game"
        case unlocksCount = "UnlocksCount"
        case totalPlayers = "TotalPlayers"
//        case unlocks = "Unlocks"
    }
}


public extension AchievementUnlocks_DTO {
    
    // MARK: - Unlock
    public struct Unlock_DTO: Codable {
        public var user, raPoints, dateAwarded, hardcoreMode: String?

        enum CodingKeys: String, CodingKey {
            case user = "User"
            case raPoints = "RAPoints"
            case dateAwarded = "DateAwarded"
            case hardcoreMode = "HardcoreMode"
        }
    }
}

extension AchievementUnlocks_DTO.Unlock_DTO : Hashable {
    
}
