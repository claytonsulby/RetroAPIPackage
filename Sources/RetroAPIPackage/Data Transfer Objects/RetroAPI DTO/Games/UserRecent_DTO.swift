// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserRecent_DTO: Codable {

    public var title, consoleName:String
    private var _gameID, _consoleID: StringMapTo<Int>
    private var _imageIcon: String
    
    private var _lastPlayed: String
    
    private var _myVote: String?
    private var _numPossibleAchievements, _possibleScore, _numAchieved, _scoreAchieved: DecodeNilUnless<Int>
    
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
        get { return _numPossibleAchievements.decoded }
        set { _numPossibleAchievements.decoded = newValue }
    }
    
    public var possibleScore:Int? {
        get { return _possibleScore.decoded }
        set { _possibleScore.decoded = newValue }
    }
    
    public var numAchieved:Int? {
        get { return _numAchieved.decoded }
        set { _numAchieved.decoded = newValue }
    }
    
    public var scoreAchieved:Int? {
        get { return _scoreAchieved.decoded }
        set { _scoreAchieved.decoded = newValue }
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
    }
    
}

public typealias UserRecents_DTO = [UserRecent_DTO]
