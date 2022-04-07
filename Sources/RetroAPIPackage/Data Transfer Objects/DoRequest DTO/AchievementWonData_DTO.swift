// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct AchievementWonData_DTO: Codable, DTO {
    let success: Bool
    let offset, count, friendsOnly, achievementID: Int
    let response: Response_DTO

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case offset = "Offset"
        case count = "Count"
        case friendsOnly = "FriendsOnly"
        case achievementID = "AchievementID"
        case response = "Response"
    }
}

// MARK: - Response
public struct Response_DTO: Codable, DTO {
    let numEarned, gameID, totalPlayers: Int
    let recentWinner: [RecentWinner_DTO]?

    enum CodingKeys: String, CodingKey {
        case numEarned = "NumEarned"
        case gameID = "GameID"
        case totalPlayers = "TotalPlayers"
        case recentWinner = "RecentWinner"
    }
}

// MARK: - RecentWinner
public struct RecentWinner_DTO: Codable, DTO {
    let user: String
    let raPoints, dateAwarded: Int

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case raPoints = "RAPoints"
        case dateAwarded = "DateAwarded"
    }
}
