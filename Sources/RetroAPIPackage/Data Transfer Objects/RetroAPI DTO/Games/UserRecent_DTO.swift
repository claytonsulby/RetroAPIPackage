// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserRecent_DTO: Codable, Equatable {
    
    public var title, consoleName:String
    private var _gameID, _consoleID: StringMapTo<Int>
    private var _imageIcon: String
    
    private var _lastPlayed: String
    
    private var _myVote: String?
    private var _numPossibleAchievements, _possibleScore, _numAchieved, _scoreAchieved, _numAchievedHardcore, _scoreAchievedHardcore: DecodeNilUnless<String>
    
    public var gameID:Int {
        get { return _gameID.decoded }
        set { _gameID.decoded = newValue }
    }
    
    public var consoleID:Int {
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
    
    public var lastPlayed:Date {
        get { return DateFormatter.standardFormat(from: _lastPlayed) ?? Date(timeIntervalSince1970: 0) }
        set { _lastPlayed = DateFormatter().string(from: newValue) }
    }
    
    public var myVote:Double? {
        get { return _myVote != nil ? Double(_myVote!) ?? 0.0 : nil }
        set { _myVote = String(newValue ?? 0.0) }
    }

    public var numPossibleAchievements:Int? {
        get { return Int(_numPossibleAchievements.decoded ?? "") ?? 0 }
        set { _numPossibleAchievements.decoded = String(newValue ?? 0) }
    }
    
    public var possibleScore:Int? {
        get { return Int(_possibleScore.decoded ?? "") ?? 0 }
        set { _possibleScore.decoded = String(newValue ?? 0) }
    }
    
    public var numAchieved:Int? {
        get { return Int(_numAchieved.decoded ?? "") ?? 0 }
        set { _numAchieved.decoded = String(newValue ?? 0) }
    }
    
    public var scoreAchieved:Int? {
        get { return Int(_scoreAchieved.decoded ?? "") ?? 0 }
        set { _scoreAchieved.decoded = String(newValue ?? 0) }
    }
    
    public var numAchievedHardcore:Int? {
        get { return Int(_numAchievedHardcore.decoded ?? "") ?? 0 }
        set { _numAchieved.decoded = String(newValue ?? 0) }
    }
    
    public var scoreAchievedHardcore:Int? {
        get { return Int(_scoreAchievedHardcore.decoded ?? "") ?? 0 }
        set { _scoreAchieved.decoded = String(newValue ?? 0) }
    }
    
    enum CodingKeys: String, CodingKey {
        case _gameID = "GameID"
        case _consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case title = "Title"
        case _imageIcon = "ImageIcon"
        case _lastPlayed = "LastPlayed"
        case _myVote = "MyVote"
        case _numPossibleAchievements = "NumPossibleAchievements"
        case _possibleScore = "PossibleScore"
        case _numAchieved = "NumAchieved"
        case _scoreAchieved = "ScoreAchieved"
        case _numAchievedHardcore = "NumAchievedHardcore"
        case _scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
    
    public static func == (lhs: UserRecent_DTO, rhs: UserRecent_DTO) -> Bool {
        return lhs.title == rhs.title &&
        lhs.consoleName == rhs.consoleName &&
        lhs._gameID == rhs._gameID &&
        lhs._consoleID == rhs._consoleID &&
        lhs._imageIcon == rhs._imageIcon &&
        lhs._lastPlayed == rhs._lastPlayed &&
        lhs._myVote == rhs._myVote &&
        lhs._numPossibleAchievements == rhs._numPossibleAchievements &&
        lhs._possibleScore == rhs._possibleScore &&
        lhs._numAchieved == rhs._numAchieved &&
        lhs._scoreAchieved == rhs._scoreAchieved &&
        lhs._numAchievedHardcore == rhs._numAchievedHardcore &&
        lhs._scoreAchievedHardcore == rhs._scoreAchievedHardcore
    }
    
}

public typealias UserRecents_DTO = [UserRecent_DTO]
