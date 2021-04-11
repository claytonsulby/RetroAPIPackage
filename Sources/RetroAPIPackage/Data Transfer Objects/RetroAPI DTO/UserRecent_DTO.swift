// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserRecent_DTO: Codable, Equatable {
    public init(gameID: String? = nil, consoleID: String? = nil, consoleName: String? = nil, title: String? = nil, imageIcon: String? = nil, lastPlayed: String? = nil, myVote: String? = nil, numPossibleAchievements: PHPHelper.JSONIntOrString? = nil, possibleScore: PHPHelper.JSONIntOrString? = nil, numAchieved: PHPHelper.JSONIntOrString? = nil, scoreAchieved: PHPHelper.JSONIntOrString? = nil) {
        self.gameID = gameID
        self.consoleID = consoleID
        self.consoleName = consoleName
        self.title = title
        self.imageIcon = imageIcon
        self.lastPlayed = lastPlayed
        self.myVote = myVote
        self.numPossibleAchievements = numPossibleAchievements
        self.possibleScore = possibleScore
        self.numAchieved = numAchieved
        self.scoreAchieved = scoreAchieved
    }
    
    public var gameID, consoleID, consoleName, title: String?
    public var imageIcon, lastPlayed: String?
    public var myVote: String?
    public var numPossibleAchievements, possibleScore, numAchieved, scoreAchieved: PHPHelper.JSONIntOrString?

    enum CodingKeys: String, CodingKey {
        case gameID = "GameID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case title = "Title"
        case imageIcon = "ImageIcon"
        case lastPlayed = "LastPlayed"
        case myVote = "MyVote"
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
    }
    
    public static func == (lhs: UserRecent_DTO, rhs: UserRecent_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.consoleID == rhs.consoleID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.title == rhs.title &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.lastPlayed == rhs.lastPlayed &&
            lhs.myVote == rhs.myVote &&
            lhs.numPossibleAchievements == rhs.numPossibleAchievements &&
            lhs.possibleScore == rhs.possibleScore &&
            lhs.numAchieved == rhs.numAchieved &&
            lhs.scoreAchieved == rhs.scoreAchieved
    }
}

public typealias UserRecents_DTO = [UserRecent_DTO]
