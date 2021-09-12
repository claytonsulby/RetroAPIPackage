// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(GameList_DTO.self, from: jsonData)

import Foundation

// MARK: - GameListElement_DTO
public struct GameListElement_DTO: Codable, Equatable {
    public init(title: String = "", consoleName: String = "", _gameID: StringMapTo<Int> = StringMapTo(0), _consoleID: StringMapTo<Int> = StringMapTo(0), _imageIcon: String = "") {
        self.title = title
        self.consoleName = consoleName
        self._gameID = _gameID
        self._consoleID = _consoleID
        self._imageIcon = _imageIcon
    }
    
    
    public var title, consoleName:String
    private var _gameID, _consoleID: StringMapTo<Int>
    private var _imageIcon: String
    
    public var gameID: Int {
        get { return _gameID.decoded }
        set { _gameID.decoded = newValue }
    }
    
    public var consoleID: Int {
        get { return _consoleID.decoded }
        set { _consoleID.decoded = newValue }
    }
    
    public var imageIconURL: URL? {

        if _imageIcon == "/Images/000001.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
        
    }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case _gameID = "ID"
        case _consoleID = "ConsoleID"
        case _imageIcon = "ImageIcon"
        case consoleName = "ConsoleName"
    }
    
    public static func == (lhs: GameListElement_DTO, rhs: GameListElement_DTO) -> Bool {
        return lhs.title == rhs.title &&
            lhs.consoleName == rhs.consoleName &&
            lhs.gameID == rhs.gameID &&
            lhs.consoleID == rhs.consoleID &&
            lhs._imageIcon == rhs._imageIcon
    }
}

public typealias GameList_DTO = [GameListElement_DTO]
