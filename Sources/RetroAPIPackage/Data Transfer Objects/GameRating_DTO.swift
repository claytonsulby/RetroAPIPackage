// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct GameRating_DTO: Codable {
    public var gameID: String?
    public var ratings: Ratings_DTO?

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case ratings = "Ratings"
    }
}

// MARK: - Ratings
public struct Ratings_DTO: Codable {
    public var game, achievements, gameNumVotes, achievementsNumVotes: String?

    enum CodingKeys: String, CodingKey {
        case game = "Game"
        case achievements = "Achievements"
        case gameNumVotes = "GameNumVotes"
        case achievementsNumVotes = "AchievementsNumVotes"
    }
}
