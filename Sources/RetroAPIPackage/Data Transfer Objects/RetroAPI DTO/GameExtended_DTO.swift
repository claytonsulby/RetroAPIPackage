// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - ExtendedGamesInfo_DTO
/// - [Sucees](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
/// - [Failure](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=)
public struct GameExtended_DTO: Codable, Equatable {
    public init(gameID: Int? = nil, title: String? = nil, consoleID: Int? = nil, forumTopicID: Int? = nil, flags: Int? = nil, imageIcon: String? = nil, imageTitle: String? = nil, imageInGame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, released: String? = nil, isFinal: Bool? = nil, consoleName: String? = nil, richPresencePatch: String? = nil, numAchievements: Int? = nil, numDistinctPlayersCasual: PHPHelper.JSONPrimitiveType? = nil, numDistinctPlayersHardcore: PHPHelper.JSONPrimitiveType? = nil, achievements: [String: GameExtended_DTO.Achievement_DTO]? = nil) {
        self.gameID = gameID
        self.title = title
        self.consoleID = consoleID
        self.forumTopicID = forumTopicID
        self.flags = flags
        self.imageIcon = imageIcon
        self.imageTitle = imageTitle
        self.imageInGame = imageInGame
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
    }
    
    ///Integer identifier for game
    public var gameID: Int?
    
    ///Title of game
    public var title: String?
    
    ///ID Number string for console
    public var consoleID: Int?
    
    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    public var forumTopicID: Int?
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    public var flags: Int?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    public var imageIcon: String?
    
    ///partial path struing to title screen image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    public var imageTitle: String?
    
    ///partial path string to gameplay screenshot image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    public var imageInGame: String?
    
    ///partial path string to box art image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    public var imageBoxArt: String?
    
    ///String of publisher for a game
    /// - note: This is different for hacked games.
    public var publisher: String?
    
    ///String of developer for a game
    /// - note: This is different for hacked games.
    public var developer: String?
    
    ///genre string for a game
    /// - note: These genre's are not well maintained and are not consistent.
    public var genre: String?
    
    ///release date string for a game
    /// - note: The format of dates vary and often there are multiple.
    public var released: String?
    
    /// - remark: I do not know what this means, but I assume it indicates if the game will continue to be editted.
    public var isFinal: Bool?
    
    ///String name for console
    public var consoleName: String?
    
    /// - remark: I am not entirely sure what this signifies.
    public var richPresencePatch: String?
    
    ///The number of achievements for the game.
    public var numAchievements: Int?
    
    ///The sum total of players who have been awarded an achievement not in hardcore mode.
    public var numDistinctPlayersCasual: PHPHelper.JSONPrimitiveType?
    
    ///The sum total of players who have been awarded an achievement in hardcore mode.
    public var numDistinctPlayersHardcore: PHPHelper.JSONPrimitiveType?
    
    ///Array of achievements
    public var achievements: [String: GameExtended_DTO.Achievement_DTO]?
    
    enum CodingKeys: String, CodingKey {
        case gameID = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case imageIcon = "ImageIcon"
        case imageTitle = "ImageTitle"
        case imageInGame = "ImageIngame"
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
    
    public static func == (lhs: GameExtended_DTO, rhs: GameExtended_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.title == rhs.title &&
            lhs.consoleID == rhs.consoleID &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.imageTitle == rhs.imageTitle &&
            lhs.imageInGame == rhs.imageInGame &&
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
            lhs.achievements == rhs.achievements
    }
}

public extension GameExtended_DTO {
    
    //TODO: quick help comments
    public struct Achievement_DTO: Codable, Equatable {
        public init(achievementID: String? = nil, numAwarded: String? = nil, numAwardedHardcore: String? = nil, title: String? = nil, achievementDescription: String? = nil, points: String? = nil, trueRatio: String? = nil, author: String? = nil, dateModified: String? = nil, dateCreated: String? = nil, badgeName: String? = nil, displayOrder: String? = nil, memAddr: String? = nil) {
            self.achievementID = achievementID
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
        
        public var achievementID: String?
        public var numAwarded: String?
        public var numAwardedHardcore: String?
        public var title: String?
        public var achievementDescription: String?
        public var points: String?
        public var trueRatio: String?
        public var author: String?
        public var dateModified: String?
        public var dateCreated: String?
        public var badgeName: String?
        public var displayOrder: String?
        public var memAddr: String?
        
        enum CodingKeys: String, CodingKey {
            case achievementID = "ID"
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
        
        public static func == (lhs: GameExtended_DTO.Achievement_DTO, rhs: GameExtended_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
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
}
