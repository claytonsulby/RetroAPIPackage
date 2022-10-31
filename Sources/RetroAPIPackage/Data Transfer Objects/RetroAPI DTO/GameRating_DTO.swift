// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct GameRating_DTO: Codable, Equatable {
    public init(gameID: Int? = nil, ratings: Ratings_DTO? = nil) {
        self.gameID = gameID
        self.ratings = ratings
    }
    
    public var gameID: Int?
    public var ratings: Ratings_DTO?

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case ratings = "Ratings"
    }
    
    public static func == (lhs: GameRating_DTO, rhs: GameRating_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.ratings == rhs.ratings
    }
}

public extension GameRating_DTO {
    
    struct Ratings_DTO: Codable, Equatable {
        
        public init(game: Double? = 0.0, achievements: Double? = 0.0, gameNumVotes: Int? = 0, achievementsNumVotes: Int? = 0) {
            self.game = game
            self.achievements = achievements
            self.gameNumVotes = gameNumVotes
            self.achievementsNumVotes = achievementsNumVotes
        }
        
        public let game, achievements: Double?
        public let gameNumVotes, achievementsNumVotes: Int?

        enum CodingKeys: String, CodingKey {
            case game = "Game"
            case achievements = "Achievements"
            case gameNumVotes = "GameNumVotes"
            case achievementsNumVotes = "AchievementsNumVotes"
        }
        
        public static func == (lhs: Ratings_DTO, rhs: Ratings_DTO) -> Bool {
            return lhs.game == rhs.game &&
            lhs.achievements == rhs.achievements &&
            lhs.gameNumVotes == rhs.gameNumVotes &&
            lhs.achievementsNumVotes == rhs.achievementsNumVotes
        }
        
    }
    
}
