// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable, Equatable {

    public let title, consoleName: String
    
    private let _hardcoreMode:String
    
    public let gameID, consoleID: Int
    private let _imageIcon: String
    private let _maxPossible: PHPHelper.PHPInt?
    private let _pctWon: String
    private let _numAwarded: PHPHelper.PHPInt?

    public var hardcoreMode:Bool {
        get { return _hardcoreMode == "1" }
    }
    
    public var numAwardedToUser: Int {
        get { return _numAwarded?.decoded ?? 0  }
    }
    
    public var numAwardedToUserHardcore: Int {
        get { return hardcoreMode ? _numAwarded?.decoded ?? 0 : 0 }
    }
    
    public var numAchievements: Int? {
        get { return _maxPossible?.decoded }
    }
    
    public var numAchievementsHardcore: Int? {
        get { return hardcoreMode ? _maxPossible?.decoded : nil }
    }
    
    public var userCompletion: Double? {
        get { return Double(_pctWon) }
    }
    
    public var userCompletionHardcore: Double? {
        get { return hardcoreMode ? Double(_pctWon) : nil }
    }

    public var imageIconURL: URL? {
        if _imageIcon == "/Images/000001.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
    }

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleName = "ConsoleName"
        case consoleID = "ConsoleID"
        case _imageIcon = "ImageIcon"
        case title = "Title"
        case _maxPossible = "MaxPossible"
        case _numAwarded = "NumAwarded"
        case _pctWon = "PctWon"
        case _hardcoreMode = "HardcoreMode"
    }

}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]
