// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(UserRank_DTO.self, from: jsonData)

import Foundation

// MARK: - UserRank_DTO
public struct UserRank_DTO: Codable, Equatable {
    internal init(score: Int? = nil, rank: Int? = nil, totalRanked: String? = nil) {
        self.score = score
        self.rank = rank
        self.totalRanked = totalRanked
    }
    
    public var score, rank: Int?
    public var totalRanked: String?

    enum CodingKeys: String, CodingKey {
        case score = "Score"
        case rank = "Rank"
        case totalRanked = "TotalRanked"
    }
    
    public static func == (lhs: UserRank_DTO, rhs: UserRank_DTO) -> Bool {
        return lhs.score == rhs.score &&
            lhs.rank == rhs.rank &&
            lhs.totalRanked == rhs.totalRanked
    }
}
