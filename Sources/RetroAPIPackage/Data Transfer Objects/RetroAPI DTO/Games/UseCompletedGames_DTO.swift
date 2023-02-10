// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable, Equatable {
    public init(title: String = "", consoleName: String = "", _gameID: String = "", _consoleID: String = "", _imageIcon: String = "", _maxPossible: String = "", _pctWon: String = "", _numAwarded: String = "", _hardcoreMode:String = "") {
        self.title = title
        self.consoleName = consoleName
        self._gameID = _gameID
        self._consoleID = _consoleID
        self._imageIcon = _imageIcon
        self._maxPossible = _maxPossible
//        self._maxAwHardcoreMode = _maxAwHardcoreMode
        self._pctWon = _pctWon
//        self._pctWonHC = _pctWonHC
        self._numAwarded = _numAwarded
//        self._numAwardedHC = _numAwardedHC
        self._hardcoreMode = _hardcoreMode
    }

    public let title, consoleName: String
    
    private let _hardcoreMode:String
    
    private let _gameID, _consoleID, _imageIcon: String
    private let _maxPossible: String
    private let _pctWon: String
    private let _numAwarded: String
    
//    private let _maxAwHardcoreMode, _numAwardedHC, _pctWonHC: String

    public var gameID: Int {
        get { return Int(_gameID) ?? -1  }
    }
    
    public var consleID: Int {
        get { return Int(_consoleID) ?? -1  }
    }
    
    public var hardcoreMode:Bool {
        get { return _hardcoreMode == "1" }
    }
    
    public var numAwardedToUser: Int {
        get { return Int(_numAwarded) ?? 0  }
    }
    
    public var numAwardedToUserHardcore: Int {
        get { return hardcoreMode ? Int(_numAwarded) ?? 0 : 0  }
    }
    
    public var numAchievements: Int? {
        get { return Int(_maxPossible) }
    }
    
    public var numAchievementsHardcore: Int? {
        get { return hardcoreMode ? Int(_maxPossible) : 0  }
    }
    
    public var userCompletion: Double? {
        get { return Double(_pctWon) ?? 0.0  }
    }
    
    public var userCompletionHardcore: Double? {
        get { return hardcoreMode ? Double(_pctWon) ?? 0.0 : 0.0  }
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
//        case _maxAwHardcoreMode = "MAX(aw.HardcoreMode)"
        case _numAwarded = "NumAwarded"
//        case _numAwardedHC = "NumAwardedHC"
        case _pctWon = "PctWon"
//        case _pctWonHC = "PctWonHC"
        case _hardcoreMode = "HardcoreMode"
    }

}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]
