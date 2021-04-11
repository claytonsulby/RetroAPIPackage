// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserGameRankAndScoreElement_DTO: Codable, Equatable {
    public init(user: String? = nil, totalScore: String? = nil, lastAward: String? = nil, userRank: String? = nil) {
        self.user = user
        self.totalScore = totalScore
        self.lastAward = lastAward
        self.userRank = userRank
    }
    
    public var user, totalScore, lastAward, userRank: String?

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case totalScore = "TotalScore"
        case lastAward = "LastAward"
        case userRank = "UserRank"
    }
    
    public static func == (lhs: UserGameRankAndScoreElement_DTO, rhs: UserGameRankAndScoreElement_DTO) -> Bool {
        return lhs.user == rhs.user &&
            lhs.totalScore == rhs.totalScore &&
            lhs.lastAward == rhs.lastAward &&
            lhs.userRank == rhs.userRank
    }
}

public typealias UserGameRankAndScore_DTO = [UserGameRankAndScoreElement_DTO]
