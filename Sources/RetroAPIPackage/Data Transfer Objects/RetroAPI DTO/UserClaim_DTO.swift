//
//  File.swift
//  
//
//  Created by Clayton Sulby on 10/31/22.
//

import Foundation

// MARK: - WelcomeElement
public struct UserClaim_DTO: Codable, Equatable {
    public init(id: String = "", user: String = "", gameID: String = "", gameTitle: String = "", gameIcon: String = "", consoleName: String = "", claimType: String = "", setType: String = "", status: String = "", welcomeExtension: String = "", special: String = "", created: String = "", doneTime: String = "", updated: String = "", minutesLeft: String = "") {
        self.id = id
        self.user = user
        self.gameID = gameID
        self.gameTitle = gameTitle
        self.gameIcon = gameIcon
        self.consoleName = consoleName
        self.claimType = claimType
        self.setType = setType
        self.status = status
        self.welcomeExtension = welcomeExtension
        self.special = special
        self.created = created
        self.doneTime = doneTime
        self.updated = updated
        self.minutesLeft = minutesLeft
    }
    
    public let id, user, gameID, gameTitle: String
    public let gameIcon, consoleName, claimType, setType: String
    public let status, welcomeExtension, special, created: String
    public let doneTime, updated, minutesLeft: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case user = "User"
        case gameID = "GameID"
        case gameTitle = "GameTitle"
        case gameIcon = "GameIcon"
        case consoleName = "ConsoleName"
        case claimType = "ClaimType"
        case setType = "SetType"
        case status = "Status"
        case welcomeExtension = "Extension"
        case special = "Special"
        case created = "Created"
        case doneTime = "DoneTime"
        case updated = "Updated"
        case minutesLeft = "MinutesLeft"
    }
    
    public static func == (lhs: UserClaim_DTO, rhs: UserClaim_DTO) -> Bool {
        return lhs.id == rhs.id &&
        lhs.user == rhs.user &&
        lhs.gameID == rhs.gameID &&
        lhs.gameTitle == rhs.gameTitle &&
        lhs.gameIcon == rhs.gameIcon &&
        lhs.consoleName == rhs.consoleName &&
        lhs.claimType == rhs.claimType &&
        lhs.setType == rhs.setType &&
        lhs.status == rhs.status &&
        lhs.welcomeExtension == rhs.welcomeExtension &&
        lhs.special == rhs.special &&
        lhs.created == rhs.created &&
        lhs.doneTime == rhs.doneTime &&
        lhs.updated == rhs.updated &&
        lhs.minutesLeft == rhs.minutesLeft
    }
}

public typealias UserClaims_DTO = [UserClaim_DTO]
