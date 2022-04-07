// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct LBInfo_DTO: Codable, DTO {
    let success: Bool
    let leaderboardData: LeaderboardData_DTO

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case leaderboardData = "LeaderboardData"
    }
}

// MARK: - LeaderboardData
public struct LeaderboardData_DTO: Codable, DTO {
    let lbid, gameID: Int
    let gameTitle: String?
    let lowerIsBetter: Int
    let lbTitle, lbDesc, lbFormat, lbMem: String?
    let lbAuthor: JSONNull?
    let consoleID: Int
    let consoleName: String?
    let forumTopicID: Int
    let gameIcon, lbCreated, lbUpdated: String?
    let totalEntries: Int
    let entries: [Entry_DTO]

    enum CodingKeys: String, CodingKey {
        case lbid = "LBID"
        case gameID = "GameID"
        case gameTitle = "GameTitle"
        case lowerIsBetter = "LowerIsBetter"
        case lbTitle = "LBTitle"
        case lbDesc = "LBDesc"
        case lbFormat = "LBFormat"
        case lbMem = "LBMem"
        case lbAuthor = "LBAuthor"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case forumTopicID = "ForumTopicID"
        case gameIcon = "GameIcon"
        case lbCreated = "LBCreated"
        case lbUpdated = "LBUpdated"
        case totalEntries = "TotalEntries"
        case entries = "Entries"
    }
}

// MARK: - Entry
public struct Entry_DTO: Codable, DTO {
    let user: String
    let score, dateSubmitted, rank, index: Int

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case score = "Score"
        case dateSubmitted = "DateSubmitted"
        case rank = "Rank"
        case index = "Index"
    }
}
