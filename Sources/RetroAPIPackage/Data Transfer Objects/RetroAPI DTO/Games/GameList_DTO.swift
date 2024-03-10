// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(GameList_DTO.self, from: jsonData)

import Foundation

// MARK: - GameListElement_DTO
public struct GameListElement_DTO: Codable, Equatable {
    internal init(title: String = "", gameID: Int = 0, consoleID: Int = 0, consoleName: String = "", _imageIcon: String, numAchievements: Int = 0, numLeaderboards: Int = 0, points: Int = 0, dateModified: String? = nil, forumTopicID: Int? = nil) {
        self.title = title
        self.gameID = gameID
        self.consoleID = consoleID
        self.consoleName = consoleName
        self._imageIcon = _imageIcon
        self.numAchievements = numAchievements
        self.numLeaderboards = numLeaderboards
        self.points = points
        self.dateModified = dateModified
        self.forumTopicID = forumTopicID
    }

    public let title: String
    public let gameID, consoleID: Int
    public let consoleName:String
    private let _imageIcon: String
    public let numAchievements, numLeaderboards, points: Int
    public let dateModified: String?
    public let forumTopicID: Int?
    
    public var imageIconURL: URL? {

        if _imageIcon == "/Images/000001.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
        
    }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case gameID = "ID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case _imageIcon = "ImageIcon"
        case numAchievements = "NumAchievements"
        case numLeaderboards = "NumLeaderboards"
        case points = "Points"
        case dateModified = "DateModified"
        case forumTopicID = "ForumTopicID"
    }
    
    public static func == (lhs: GameListElement_DTO, rhs: GameListElement_DTO) -> Bool {
        return lhs.title == rhs.title &&
        lhs.gameID == rhs.gameID &&
        lhs.consoleID == rhs.consoleID &&
        lhs.consoleName == rhs.consoleName &&
        lhs._imageIcon == rhs._imageIcon &&
        lhs.numAchievements == rhs.numAchievements &&
        lhs.numLeaderboards == rhs.numLeaderboards &&
        lhs.points == rhs.points &&
        lhs.dateModified == rhs.dateModified &&
        lhs.forumTopicID == rhs.forumTopicID
    }
}

public typealias GameList_DTO = [GameListElement_DTO]
