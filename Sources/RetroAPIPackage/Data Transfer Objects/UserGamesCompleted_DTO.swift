// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable {
    var gameID, consoleName, imageIcon, title: String?
    var numAwarded, maxPossible, pctWon, hardcoreMode: String?

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
}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]

// API gets all games with non-zero progress
