// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
///
/// - [Success: Official Game](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
/// - [Success: Hub](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=3090)
/// - [Success: Hack](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10781)
/// - [Failure:  gameID not provided](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=)
/// - [Failure: gameID too large](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=1000000000)
public struct Game_DTO: Codable, Equatable {
    public init(title: String? = nil, forumTopicID: String? = nil, consoleID: String? = nil, consoleName: String? = nil, flags: String? = nil, imageIcon: String? = nil, gameIcon: String? = nil, imageTitle: String? = nil, imageInGame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, released: String? = nil, gameTitle: String? = nil, console: String? = nil) {
        self.title = title
        self.forumTopicID = forumTopicID
        self.consoleID = consoleID
        self.consoleName = consoleName
        self.flags = flags
        self.imageIcon = imageIcon
        self.gameIcon = gameIcon
        self.imageTitle = imageTitle
        self.imageInGame = imageInGame
        self.imageBoxArt = imageBoxArt
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self.released = released
        self.gameTitle = gameTitle
        self.console = console
    }
    
    ///Title of game
    /// - remark: So far this has been identical to ``gameTitle``
    public var title: String?
    
    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    public var forumTopicID: String?
    
    ///ID Number string for console
    public var consoleID: String?
    
    ///String name for console
    /// - remark: So far this has been identical to ``console``
    public var consoleName: String?
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    public var flags: String?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``gameIcon``
    public var imageIcon: String?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``imageIcon``
    public var gameIcon: String?
    
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
    
    ///Title of game
    /// - remark: So far this has been identical to ``gameTitle``
    public var gameTitle: String?
    
    ///String name for console
    /// - remark: So far this has been identical to ``consoleName``
    public var console: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case forumTopicID = "ForumTopicID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case flags = "Flags"
        case imageIcon = "ImageIcon"
        case gameIcon = "GameIcon"
        case imageTitle = "ImageTitle"
        case imageInGame = "ImageIngame"
        case imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case released = "Released"
        case gameTitle = "GameTitle"
        case console = "Console"
    }
    
    public static func == (lhs: Game_DTO, rhs: Game_DTO) -> Bool {
        return lhs.title == rhs.title &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.consoleID == rhs.consoleID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.flags == rhs.flags &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.gameIcon == rhs.gameIcon &&
            lhs.imageTitle == rhs.imageTitle &&
            lhs.imageInGame == rhs.imageInGame &&
            lhs.imageBoxArt == rhs.imageBoxArt &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs.released == rhs.released &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.console == rhs.console
    }
}
