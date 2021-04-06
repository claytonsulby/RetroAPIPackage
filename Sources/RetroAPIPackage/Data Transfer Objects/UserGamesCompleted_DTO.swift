// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable, Equatable {
    internal init(gameID: String? = nil, consoleName: String? = nil, imageIcon: String? = nil, title: String? = nil, numAwarded: String? = nil, maxPossible: String? = nil, pctWon: String? = nil, hardcoreMode: String? = nil) {
        self.gameID = gameID
        self.consoleName = consoleName
        self.imageIcon = imageIcon
        self.title = title
        self.numAwarded = numAwarded
        self.maxPossible = maxPossible
        self.pctWon = pctWon
        self.hardcoreMode = hardcoreMode
    }
    
    public var gameID, consoleName, imageIcon, title: String?
    public var numAwarded, maxPossible, pctWon, hardcoreMode: String?

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleName = "ConsoleName"
        case imageIcon = "ImageIcon"
        case title = "Title"
        case numAwarded = "NumAwarded"
        case maxPossible = "MaxPossible"
        case pctWon = "PctWon"
        case hardcoreMode = "HardcoreMode"
    }
    
    public static func == (lhs: UserCompletedGame_DTO, rhs: UserCompletedGame_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.title == rhs.title &&
            lhs.numAwarded == rhs.numAwarded &&
            lhs.maxPossible == rhs.maxPossible &&
            lhs.pctWon == rhs.pctWon &&
            lhs.hardcoreMode == rhs.hardcoreMode
    }
}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]

// API gets all games with non-zero progress
