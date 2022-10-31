// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
public struct TicketData_DTO: Codable, Equatable {
    public init(recentTickets: [RecentTicket_DTO]? = nil, openTickets: Int? = nil, url: String? = nil) {
        self.recentTickets = recentTickets
        self.openTickets = openTickets
        self.url = url
    }
    
    public var recentTickets: [RecentTicket_DTO]?
    public var openTickets: Int?
    public var url: String?

    enum CodingKeys: String, CodingKey {
        case recentTickets = "RecentTickets"
        case openTickets = "OpenTickets"
        case url = "URL"
    }
    
    public static func == (lhs: TicketData_DTO, rhs: TicketData_DTO) -> Bool {
        return lhs.recentTickets == rhs.recentTickets &&
            lhs.openTickets == rhs.openTickets &&
            lhs.url == rhs.url
    }
}

// MARK: - RecentTicket
public struct RecentTicket_DTO: Codable, Equatable {
    public init(id: String? = nil, achievementID: String? = nil, achievementTitle: String? = nil, achievementDesc: String? = nil, points: String? = nil, badgeName: String? = nil, achievementAuthor: String? = nil, gameID: String? = nil, consoleName: String? = nil, gameTitle: String? = nil, gameIcon: String? = nil, reportedAt: String? = nil, reportType: String? = nil, reportNotes: String? = nil, reportedBy: String? = nil, resolvedAt: JSONNull? = nil, resolvedBy: JSONNull? = nil, reportState: String? = nil, reportStateDescription:String = "", reportTypeDescription:String = "") {
        self.id = id
        self.achievementID = achievementID
        self.achievementTitle = achievementTitle
        self.achievementDesc = achievementDesc
        self.points = points
        self.badgeName = badgeName
        self.achievementAuthor = achievementAuthor
        self.gameID = gameID
        self.consoleName = consoleName
        self.gameTitle = gameTitle
        self.gameIcon = gameIcon
        self.reportedAt = reportedAt
        self.reportType = reportType
        self.reportNotes = reportNotes
        self.reportedBy = reportedBy
        self.resolvedAt = resolvedAt
        self.resolvedBy = resolvedBy
        self.reportState = reportState
        self.reportStateDescription = reportStateDescription
        self.reportTypeDescription = reportTypeDescription
    }
    
    public var id, achievementID, achievementTitle, achievementDesc: String?
    public var points, badgeName, achievementAuthor, gameID: String?
    public var consoleName, gameTitle, gameIcon, reportedAt: String?
    public var reportType, reportNotes, reportedBy: String?
    public var resolvedAt, resolvedBy: JSONNull? //FIXME: probably a dict that isn't available yet, will crash if different
    public var reportState: String?
    public let reportStateDescription:String
    public let reportTypeDescription:String

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
        case reportStateDescription = "ReportStateDescription"
        case reportTypeDescription = "ReportTypeDescription"
    }
    
    public static func == (lhs: RecentTicket_DTO, rhs: RecentTicket_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.achievementID == rhs.achievementID &&
            lhs.achievementTitle == rhs.achievementTitle &&
            lhs.achievementDesc == rhs.achievementDesc &&
            lhs.points == rhs.points &&
            lhs.badgeName == rhs.badgeName &&
            lhs.achievementAuthor == rhs.achievementAuthor &&
            lhs.gameID == rhs.gameID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.gameIcon == rhs.gameIcon &&
            lhs.reportedAt == rhs.reportedAt &&
            lhs.reportType == rhs.reportType &&
            lhs.reportNotes == rhs.reportNotes &&
            lhs.reportedBy == rhs.reportedBy &&
            lhs.resolvedAt == rhs.resolvedAt &&
            lhs.resolvedBy == rhs.resolvedBy &&
            lhs.reportState == rhs.reportState
    }
}

