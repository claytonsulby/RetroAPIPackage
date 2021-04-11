// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserGameRankAndScoreElement_DTO: Codable {
    public var user, totalScore, lastAward, userRank: String?

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case totalScore = "TotalScore"
        case lastAward = "LastAward"
        case userRank = "UserRank"
    }
}

public typealias UserGameRankAndScore_DTO = [UserGameRankAndScoreElement_DTO]
