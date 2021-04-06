// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(GameList_DTO.self, from: jsonData)

import Foundation

// MARK: - GameListElement_DTO
public struct GameListElement_DTO: Codable, Equatable {
    public init(title: String? = nil, id: String? = nil, consoleID: String? = nil, imageIcon: String? = nil, consoleName: String? = nil) {
        self.title = title
        self.id = id
        self.consoleID = consoleID
        self.imageIcon = imageIcon
        self.consoleName = consoleName
    }
    
    public var title, id, consoleID, imageIcon, consoleName: String?

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case id = "ID"
        case consoleID = "ConsoleID"
        case imageIcon = "ImageIcon"
        case consoleName = "ConsoleName"
    }
    
    public static func == (lhs: GameListElement_DTO, rhs: GameListElement_DTO) -> Bool {
        return lhs.title == rhs.title &&
            lhs.id == rhs.id &&
            lhs.consoleID == rhs.consoleID &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.consoleName == rhs.consoleName
    }
}

public typealias GameList_DTO = [GameListElement_DTO]
