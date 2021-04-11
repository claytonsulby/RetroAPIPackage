// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct TicketData_DTO: Codable {
    public var recentTickets: [RecentTicket_DTO]?
    public var openTickets: String?
    public var url: String?

    enum CodingKeys: String, CodingKey {
        case recentTickets = "RecentTickets"
        case openTickets = "OpenTickets"
        case url = "URL"
    }
}

// MARK: - RecentTicket
public struct RecentTicket_DTO: Codable {
    public var id, achievementID, achievementTitle, achievementDesc: String?
    public var points, badgeName, achievementAuthor, gameID: String?
    public var consoleName, gameTitle, gameIcon, reportedAt: String?
    public var reportType, reportNotes, reportedBy: String?
    public var resolvedAt, resolvedBy: JSONNull? //FIXME: probably a dict that isn't available yet, will crash if different
    public var reportState: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case achievementID = "AchievementID"
        case achievementTitle = "AchievementTitle"
        case achievementDesc = "AchievementDesc"
        case points = "Points"
        case badgeName = "BadgeName"
        case achievementAuthor = "AchievementAuthor"
        case gameID = "GameID"
        case consoleName = "ConsoleName"
        case gameTitle = "GameTitle"
        case gameIcon = "GameIcon"
        case reportedAt = "ReportedAt"
        case reportType = "ReportType"
        case reportNotes = "ReportNotes"
        case reportedBy = "ReportedBy"
        case resolvedAt = "ResolvedAt"
        case resolvedBy = "ResolvedBy"
        case reportState = "ReportState"
    }
}

