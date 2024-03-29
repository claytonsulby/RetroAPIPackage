// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct AchievementUnlocks_DTO: Codable, Equatable {
    public init(achievement: AchievementUnlocks_DTO.Achievement_DTO? = nil, console: AchievementUnlocks_DTO.Console_DTO? = nil, game: AchievementUnlocks_DTO.Console_DTO? = nil, unlocksCount: Int? = nil, totalPlayers: Int? = nil, unlocks: [AchievementUnlocks_DTO.Unlock_DTO]? = nil) {
        self.achievement = achievement
        self.console = console
        self.game = game
        self.unlocksCount = unlocksCount
        self.totalPlayers = totalPlayers
        self.unlocks = unlocks
    }
    
    public var achievement: AchievementUnlocks_DTO.Achievement_DTO?
    public var console: AchievementUnlocks_DTO.Console_DTO?
    public var game: AchievementUnlocks_DTO.Console_DTO?
    public var unlocksCount, totalPlayers: Int?
    public var unlocks: [AchievementUnlocks_DTO.Unlock_DTO]?

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


public extension AchievementUnlocks_DTO {
    
    // MARK: - Unlock
    struct Unlock_DTO: Codable {
        let user: String
        let raPoints: Int
        let dateAwarded: String
        let hardcoreMode: Int

        enum CodingKeys: String, CodingKey {
            case user = "User"
            case raPoints = "RAPoints"
            case dateAwarded = "DateAwarded"
            case hardcoreMode = "HardcoreMode"
        }
    }
    
    struct Console_DTO: Codable, Equatable {
        let id: Int
        let title: String

        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case title = "Title"
        }
        
        public static func == (lhs: AchievementUnlocks_DTO.Console_DTO, rhs: AchievementUnlocks_DTO.Console_DTO) -> Bool {
            return lhs.id == rhs.id &&
            lhs.title == rhs.title
        }
    }
}

extension AchievementUnlocks_DTO.Unlock_DTO : Hashable {
    
}
