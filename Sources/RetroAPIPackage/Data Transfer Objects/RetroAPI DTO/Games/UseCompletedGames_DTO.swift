// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable, Equatable {
    public init(_gameID: StringMapTo<Int> = StringMapTo(0), _numAwarded: StringMapTo<Int> = StringMapTo(0), _maxPossible: StringMapTo<Int> = StringMapTo(0), consoleName: String = "", title: String = "", imageIcon: String = "", _pctWon: StringMapTo<Double> = StringMapTo(0), _hardcoreMode: String = "") {
        self._gameID = _gameID
        self._numAwarded = _numAwarded
        self._maxPossible = _maxPossible
        self.consoleName = consoleName
        self.title = title
        self.imageIcon = imageIcon
        self._pctWon = _pctWon
        self._hardcoreMode = _hardcoreMode
    }
    
    public var consoleName, title: String
    
    private var _gameID, _numAwarded, _maxPossible: StringMapTo<Int>
    private var imageIcon : String
    private var _pctWon: StringMapTo<Double>
    private var _hardcoreMode: String
    
    public var gameID: Int {
        get { return _gameID.decoded  }
        set { _gameID.decoded = newValue }
    }
    
    public var numAwardedToUser: Int {
        get { return _numAwarded.decoded  }
        set { _numAwarded.decoded = newValue }
    }
    
    public var numAchievements: Int {
        get { return _maxPossible.decoded  }
        set { _maxPossible.decoded = newValue }
    }
    
    public var userCompletion: Double {
        get { return _pctWon.decoded  }
        set { _pctWon.decoded = newValue }
    }
    
    public var hardcoreMode: Bool {
        get { return ( _hardcoreMode == "1" ? true : false )  }
        set { _hardcoreMode = (newValue == true ? "1" : "0") }
    }

    enum CodingKeys: String, CodingKey {
        case _gameID = "GameID"
        case consoleName = "ConsoleName"
        case imageIcon = "ImageIcon"
        case title = "Title"
        case _numAwarded = "NumAwarded"
        case _maxPossible = "MaxPossible"
        case _pctWon = "PctWon"
        case _hardcoreMode = "HardcoreMode"
    }
    
    //FIXME: add equitable conformance for the wrapper types
    public static func == (lhs: UserCompletedGame_DTO, rhs: UserCompletedGame_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
//            lhs._numAwarded == rhs._numAwarded &&
//            lhs._maxPossible == rhs._maxPossible &&
            lhs.consoleName == rhs.consoleName &&
            lhs.title == rhs.title &&
            lhs.imageIcon == rhs.imageIcon &&
//            lhs._pctWon == rhs._pctWon &&
            lhs._hardcoreMode == rhs._hardcoreMode
    }

}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]
