// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - GameRankAndScoreElement_DTO
public struct GameRankAndScoreElement_DTO: Codable, Equatable {
    public init(user: String, numAchievements: Int, totalScore: Int, lastAward: String) {
        self.user = user
        self.numAchievements = numAchievements
        self.totalScore = totalScore
        self.lastAward = lastAward
    }
    
    let user: String
    let numAchievements, totalScore: Int
    let lastAward: String

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case numAchievements = "NumAchievements"
        case totalScore = "TotalScore"
        case lastAward = "LastAward"
    }
    
    public static func == (lhs: GameRankAndScoreElement_DTO, rhs: GameRankAndScoreElement_DTO) -> Bool {
        return lhs.user == rhs.user &&
        lhs.numAchievements == rhs.numAchievements &&
        lhs.totalScore == rhs.totalScore &&
        lhs.lastAward == rhs.lastAward
    }
}

public typealias GameRankAndScore_DTO = [GameRankAndScoreElement_DTO]
