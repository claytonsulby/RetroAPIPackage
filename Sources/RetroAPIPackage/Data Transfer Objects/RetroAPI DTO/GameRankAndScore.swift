// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - GameRankAndScoreElement_DTO
public struct GameRankAndScoreElement_DTO: Codable, Equatable {
    public init(user: String? = nil, totalScore: String? = nil, lastAward: String? = nil) {
        self.user = user
        self.totalScore = totalScore
        self.lastAward = lastAward
    }
    
    public let user, totalScore, lastAward: String?

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case totalScore = "TotalScore"
        case lastAward = "LastAward"
    }
    
    public static func == (lhs: GameRankAndScoreElement_DTO, rhs: GameRankAndScoreElement_DTO) -> Bool {
        return lhs.user == rhs.user &&
        lhs.totalScore == rhs.totalScore &&
        lhs.lastAward == rhs.lastAward
    }
}

public typealias GameRankAndScore_DTO = [GameRankAndScoreElement_DTO]
