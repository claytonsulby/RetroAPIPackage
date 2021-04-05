// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct UserRecent_DTO: Codable {
    var gameID, consoleID, consoleName, title: String?
    var imageIcon, lastPlayed: String?
    var myVote: String?
    var numPossibleAchievements, possibleScore, numAchieved, scoreAchieved: PHPHelper.JSONIntOrString?

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
}

typealias UserRecents_DTO = [UserRecent_DTO]
