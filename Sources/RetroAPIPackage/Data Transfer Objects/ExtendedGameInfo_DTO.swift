// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

typealias ExtendedGamesInfo_DTO = [ExtendedGameInfo_DTO]

// MARK: - ExtendedGamesInfo_DTO
struct ExtendedGameInfo_DTO: Codable {
    var id: Int?
    var title: String?
    var consoleID, forumTopicID, flags: Int?
    var imageIcon, imageTitle, imageIngame, imageBoxArt: String?
    var publisher, developer, genre, released: String?
    var isFinal: Bool?
    var consoleName, richPresencePatch: String?
    var numAchievements: Int?
    var numDistinctPlayersCasual, numDistinctPlayersHardcore: String?
    var achievements: [String: ExtendedGamesInfo_Achievement_DTO]?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case imageIcon = "ImageIcon"
        case imageTitle = "ImageTitle"
        case imageIngame = "ImageIngame"
        case imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case released = "Released"
        case isFinal = "IsFinal"
        case consoleName = "ConsoleName"
        case richPresencePatch = "RichPresencePatch"
        case numAchievements = "NumAchievements"
        case numDistinctPlayersCasual = "NumDistinctPlayersCasual"
        case numDistinctPlayersHardcore = "NumDistinctPlayersHardcore"
        case achievements = "Achievements"
    }
}

// MARK: - Achievement
struct ExtendedGamesInfo_Achievement_DTO: Codable {
    var id, numAwarded, numAwardedHardcore, title: String?
    var achievementDescription, points, trueRatio: String?
    var author: String?
    var dateModified, dateCreated, badgeName, displayOrder: String?
    var memAddr: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case numAwarded = "NumAwarded"
        case numAwardedHardcore = "NumAwardedHardcore"
        case title = "Title"
        case achievementDescription = "Description"
        case points = "Points"
        case trueRatio = "TrueRatio"
        case author = "Author"
        case dateModified = "DateModified"
        case dateCreated = "DateCreated"
        case badgeName = "BadgeName"
        case displayOrder = "DisplayOrder"
        case memAddr = "MemAddr"
    }
}
