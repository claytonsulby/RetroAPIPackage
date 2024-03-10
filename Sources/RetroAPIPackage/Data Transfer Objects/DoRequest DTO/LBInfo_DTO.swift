// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct LBInfo_DTO: Codable, DTO, Equatable {
    let success: Bool
    let leaderboardData: LeaderboardData_DTO

    enum CodingKeys: String, CodingKey {
        case success = "Success"
        case leaderboardData = "LeaderboardData"
    }
    
    public static func == (lhs: LBInfo_DTO, rhs: LBInfo_DTO) -> Bool {
        return lhs.success == rhs.success &&
        lhs.leaderboardData == rhs.leaderboardData
    }
}

// MARK: - LeaderboardData
public struct LeaderboardData_DTO: Codable, DTO, Equatable {
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
    
    public static func == (lhs: LeaderboardData_DTO, rhs: LeaderboardData_DTO) -> Bool {
        return lhs.lbid == rhs.lbid &&
        lhs.gameID == rhs.gameID &&
        lhs.gameTitle == rhs.gameTitle &&
        lhs.lowerIsBetter == rhs.lowerIsBetter &&
        lhs.lbTitle == rhs.lbTitle &&
        lhs.lbDesc == rhs.lbDesc &&
        lhs.lbFormat == rhs.lbFormat &&
        lhs.lbMem == rhs.lbMem &&
        lhs.lbAuthor == rhs.lbAuthor &&
        lhs.consoleID == rhs.consoleID &&
        lhs.consoleName == rhs.consoleName &&
        lhs.forumTopicID == rhs.forumTopicID &&
        lhs.gameIcon == rhs.gameIcon &&
        lhs.lbCreated == rhs.lbCreated &&
        lhs.lbUpdated == rhs.lbUpdated &&
        lhs.totalEntries == rhs.totalEntries &&
        lhs.entries == rhs.entries
    }
}

// MARK: - Entry
public struct Entry_DTO: Codable, DTO, Equatable {
    let user: String
    let score, dateSubmitted, rank, index: Int

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case score = "Score"
        case dateSubmitted = "DateSubmitted"
        case rank = "Rank"
        case index = "Index"
    }
    
    public static func == (lhs: Entry_DTO, rhs: Entry_DTO) -> Bool {
        return lhs.user == rhs.user &&
        lhs.score == rhs.score &&
        lhs.dateSubmitted == rhs.dateSubmitted &&
        lhs.rank == rhs.rank &&
        lhs.index == rhs.index
    }
}
