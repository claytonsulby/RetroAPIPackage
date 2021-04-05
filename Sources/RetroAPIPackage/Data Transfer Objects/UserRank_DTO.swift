// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(UserRank_DTO.self, from: jsonData)

import Foundation

// MARK: - UserRank_DTO
struct UserRank_DTO: Codable {
    var score, rank: Int?
    var totalRanked: String?

    enum CodingKeys: String, CodingKey {
        case score = "Score"
        case rank = "Rank"
        case totalRanked = "TotalRanked"
    }
}
