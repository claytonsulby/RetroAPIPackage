// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(GameList_DTO.self, from: jsonData)

import Foundation

// MARK: - GameListElement_DTO
public struct GameListElement_DTO: Codable {
    var title, id, consoleID, imageIcon, consoleName: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case id = "ID"
        case consoleID = "ConsoleID"
        case imageIcon = "ImageIcon"
        case consoleName = "ConsoleName"
    }
}

public typealias GameList_DTO = [GameListElement_DTO]
