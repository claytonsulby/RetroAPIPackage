// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable, Equatable {
    public init(title: String = "", consoleName: String = "", _gameID: String = "", _consoleID: String = "", _imageIcon: String = "", _maxPossible: String = "", _maxAwHardcoreMode: String = "", _pctWon: String = "", _pctWonHC: String = "", _numAwarded: String = "", _numAwardedHC: String = "") {
        self.title = title
        self.consoleName = consoleName
        self._gameID = _gameID
        self._consoleID = _consoleID
        self._imageIcon = _imageIcon
        self._maxPossible = _maxPossible
        self._maxAwHardcoreMode = _maxAwHardcoreMode
        self._pctWon = _pctWon
        self._pctWonHC = _pctWonHC
        self._numAwarded = _numAwarded
        self._numAwardedHC = _numAwardedHC
    }

    public let title, consoleName: String
    
    private let _gameID, _consoleID, _imageIcon: String
    private let _maxPossible, _maxAwHardcoreMode: String
    private let _pctWon, _pctWonHC: String
    private let _numAwarded, _numAwardedHC: String

    public var gameID: Int {
        get { return Int(_gameID) ?? -1  }
    }
    
    public var consleID: Int {
        get { return Int(_consoleID) ?? -1  }
    }
    
    public var numAwardedToUser: Int {
        get { return Int(_numAwarded) ?? -1  }
    }
    
    public var numAwardedToUserHardcore: Int {
        get { return Int(_numAwardedHC) ?? -1  }
    }
    
    public var numAchievements: Int? {
        get { return Int(_maxPossible) }
    }
    
    public var numAchievementsHardcore: Int? {
        get { return Int(_maxAwHardcoreMode) }
    }
    
    public var userCompletion: Double? {
        get { return Double(_pctWon) ?? 0.0  }
    }
    
    public var userCompletionHardcore: Double? {
        get { return Double(_pctWonHC) ?? 0.0  }
    }

    public var imageIconURL: URL? {
        if _imageIcon == "/Images/000001.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
    }

    enum CodingKeys: String, CodingKey {
        case _gameID = "GameID"
        case consoleName = "ConsoleName"
        case _consoleID = "ConsoleID"
        case _imageIcon = "ImageIcon"
        case title = "Title"
        case _maxPossible = "MaxPossible"
        case _maxAwHardcoreMode = "MAX(aw.HardcoreMode)"
        case _numAwarded = "NumAwarded"
        case _numAwardedHC = "NumAwardedHC"
        case _pctWon = "PctWon"
        case _pctWonHC = "PctWonHC"
    }

}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]
