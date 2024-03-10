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
    public init(title: String = "", _forumTopicID:Int? = nil, _consoleID:Int? = nil, consoleName: String = "", _flags:Int? = nil, _imageIcon: String? = "", _gameIcon: String? = "", _imageTitle: String? = "", _imageInGame: String? = "", _imageBoxArt: String? = "", publisher: String? = nil, developer: String? = nil, genre: String? = nil, _released: String? = nil, gameTitle: String? = "", console: String = "") {
        self.title = title
        self.forumTopicID = _forumTopicID
        self.consoleID = _consoleID
        self.consoleName = consoleName
        self.flags = _flags
        self._imageIcon = _imageIcon
        self._gameIcon = _gameIcon
        self._imageTitle = _imageTitle
        self._imageInGame = _imageInGame
        self._imageBoxArt = _imageBoxArt
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self._released = _released
        self.gameTitle = gameTitle
        self.console = console
    }

    ///Title of game
    /// - remark: So far this has been identical to ``gameTitle``
    public var title : GameTypes.Title
    
    ///Title of game
    /// - remark: So far this has been identical to ``title``
    private var gameTitle : String?

    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    public var forumTopicID :GameTypes.ForumTopicID
    
    ///ID Number string for console
    public var consoleID : GameTypes.ConsoleID

    ///String name for console
    /// - remark: So far this has been identical to ``console``
    public var consoleName : String
    ///String name for console. Unused in favor of consoleName
    /// - remark: So far this has been identical to ``consoleName``
    private var console : String
    
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    private var flags : Int?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``gameIcon``
    private var _imageIcon : String?
    
    ///partial path string to icon image for a game. Unused in favor of imageIcon
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``imageIcon``
    private var _gameIcon : String?
    
    ///partial path struing to title screen image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageTitle : String?
    
    ///partial path string to gameplay screenshot image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageInGame : String?
    
    ///partial path string to box art image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageBoxArt : String?
    
    ///String of publisher for a game
    /// - note: This is different for hacked games.
    public var publisher : String?
    
    ///String of developer for a game
    /// - note: This is different for hacked games.
    public var developer : String?
    
    ///genre string for a game
    /// - note: These genre's are not well maintained and are not consistent.
    public var genre : String?
    
    ///release date string for a game
    /// - note: The format of dates vary and often there are multiple.
    private var _released : String?
    
    public var releaseDate: String? {
        self._released
    }

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case forumTopicID = "ForumTopicID"
        case consoleID = "ConsoleID"
        case consoleName = "ConsoleName"
        case flags = "Flags"
        case _imageIcon = "ImageIcon"
        case _gameIcon = "GameIcon"
        case _imageTitle = "ImageTitle"
        case _imageInGame = "ImageIngame"
        case _imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case _released = "Released"
        case gameTitle = "GameTitle"
        case console = "Console"
    }
    
    public static func == (lhs: Game_DTO, rhs: Game_DTO) -> Bool {
        return lhs.title == rhs.title &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.consoleID == rhs.consoleID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.flags == rhs.flags &&
            lhs._imageIcon == rhs._imageIcon &&
            lhs._gameIcon == rhs._gameIcon &&
            lhs._imageTitle == rhs._imageTitle &&
            lhs._imageInGame == rhs._imageInGame &&
            lhs._imageBoxArt == rhs._imageBoxArt &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs._released == rhs._released &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.console == rhs.console
    }

}

extension Game_DTO {
    
    public var imageIconURL: URL? {

        if _imageIcon == "/Images/000001.png" {
            return nil
        } else if _imageIcon == nil {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + (_imageIcon!))
        }
        
    }

    public var imageTitleURL: URL? {

        if _imageTitle == "/Images/000002.png" {
            return nil
        } else if _imageTitle == nil {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + (_imageTitle!))
        }

    }

    public var imageInGameURL: URL? {

        if _imageInGame == "/Images/000002.png" {
            return nil
        } else if _imageInGame == nil {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + (_imageInGame!))
        }
        
    }

    public var imageBoxArtURL: URL? {

        if _imageBoxArt == "/Images/000002.png" {
            return nil
        } else if _imageBoxArt == nil {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + (_imageBoxArt!))
        }
        
    }
    
}
