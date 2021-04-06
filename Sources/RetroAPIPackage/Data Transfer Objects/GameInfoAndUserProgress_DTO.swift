// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct GameInfoAndUserProgress_DTO: Codable, Equatable {
    public init(id: Int? = nil, title: String? = nil, consoleID: Int? = nil, forumTopicID: Int? = nil, flags: Int? = nil, imageIcon: String? = nil, imageTitle: String? = nil, imageIngame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, released: String? = nil, isFinal: Bool? = nil, consoleName: String? = nil, richPresencePatch: String? = nil, numAchievements: Int? = nil, numDistinctPlayersCasual: PHPHelper.JSONIntOrString? = nil, numDistinctPlayersHardcore: PHPHelper.JSONIntOrString? = nil, achievements: PHPHelper.GameProgressAchievements_DTO? = nil, numAwardedToUser: Int? = nil, numAwardedToUserHardcore: Int? = nil, userCompletion: PHPHelper.JSONIntOrString? = nil, userCompletionHardcore: PHPHelper.JSONIntOrString? = nil) {
        self.id = id
        self.title = title
        self.consoleID = consoleID
        self.forumTopicID = forumTopicID
        self.flags = flags
        self.imageIcon = imageIcon
        self.imageTitle = imageTitle
        self.imageIngame = imageIngame
        self.imageBoxArt = imageBoxArt
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self.released = released
        self.isFinal = isFinal
        self.consoleName = consoleName
        self.richPresencePatch = richPresencePatch
        self.numAchievements = numAchievements
        self.numDistinctPlayersCasual = numDistinctPlayersCasual
        self.numDistinctPlayersHardcore = numDistinctPlayersHardcore
        self.achievements = achievements
        self.numAwardedToUser = numAwardedToUser
        self.numAwardedToUserHardcore = numAwardedToUserHardcore
        self.userCompletion = userCompletion
        self.userCompletionHardcore = userCompletionHardcore
    }
    
    public var id: Int?
    public var title: String?
    public var consoleID, forumTopicID, flags: Int?
    public var imageIcon, imageTitle, imageIngame, imageBoxArt: String?
    public var publisher, developer, genre, released: String?
    public var isFinal: Bool?
    public var consoleName, richPresencePatch: String?
    public var numAchievements: Int?
    public var numDistinctPlayersCasual, numDistinctPlayersHardcore: PHPHelper.JSONIntOrString?
    public var achievements: PHPHelper.GameProgressAchievements_DTO?
    public var numAwardedToUser, numAwardedToUserHardcore: Int?
    public var userCompletion, userCompletionHardcore: PHPHelper.JSONIntOrString?

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
        case numAwardedToUser = "NumAwardedToUser"
        case numAwardedToUserHardcore = "NumAwardedToUserHardcore"
        case userCompletion = "UserCompletion"
        case userCompletionHardcore = "UserCompletionHardcore"
    }
    
    public static func == (lhs: GameInfoAndUserProgress_DTO, rhs: GameInfoAndUserProgress_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.consoleID == rhs.consoleID &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.imageTitle == rhs.imageTitle &&
            lhs.imageIngame == rhs.imageIngame &&
            lhs.imageBoxArt == rhs.imageBoxArt &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs.released == rhs.released &&
            lhs.isFinal == rhs.isFinal &&
            lhs.consoleName == rhs.consoleName &&
            lhs.richPresencePatch == rhs.richPresencePatch &&
            lhs.numAchievements == rhs.numAchievements &&
            lhs.numDistinctPlayersCasual == rhs.numDistinctPlayersCasual &&
            lhs.numDistinctPlayersHardcore == rhs.numDistinctPlayersHardcore &&
            lhs.achievements == rhs.achievements &&
            lhs.numAwardedToUser == rhs.numAwardedToUser &&
            lhs.numAwardedToUserHardcore == rhs.numAwardedToUserHardcore &&
            lhs.userCompletion == rhs.userCompletion &&
            lhs.userCompletionHardcore == rhs.userCompletionHardcore
    }
}

// MARK: - Achievement
public struct GameProgressAchievement_DTO: Codable, Equatable {
    public init(id: String? = nil, numAwarded: String? = nil, numAwardedHardcore: String? = nil, title: String? = nil, achievementDescription: String? = nil, points: String? = nil, trueRatio: String? = nil, author: String? = nil, dateModified: String? = nil, dateCreated: String? = nil, badgeName: String? = nil, displayOrder: String? = nil, memAddr: String? = nil) {
        self.id = id
        self.numAwarded = numAwarded
        self.numAwardedHardcore = numAwardedHardcore
        self.title = title
        self.achievementDescription = achievementDescription
        self.points = points
        self.trueRatio = trueRatio
        self.author = author
        self.dateModified = dateModified
        self.dateCreated = dateCreated
        self.badgeName = badgeName
        self.displayOrder = displayOrder
        self.memAddr = memAddr
    }
    
    public var id, numAwarded, numAwardedHardcore, title: String?
    public var achievementDescription, points, trueRatio: String?
    public var author: String?
    public var dateModified, dateCreated, badgeName, displayOrder: String?
    public var memAddr: String?

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
    
    public static func == (lhs: GameProgressAchievement_DTO, rhs: GameProgressAchievement_DTO) -> Bool {
        return lhs.id == rhs.id &&
            lhs.numAwarded == rhs.numAwarded &&
            lhs.numAwardedHardcore == rhs.numAwardedHardcore &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
            lhs.points == rhs.points &&
            lhs.trueRatio == rhs.trueRatio &&
            lhs.author == rhs.author &&
            lhs.dateModified == rhs.dateModified &&
            lhs.dateCreated == rhs.dateCreated &&
            lhs.badgeName == rhs.badgeName &&
            lhs.displayOrder == rhs.displayOrder &&
            lhs.memAddr == rhs.memAddr
    }
}
