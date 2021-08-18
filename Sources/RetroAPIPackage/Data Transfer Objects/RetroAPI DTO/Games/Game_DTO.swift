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
    
    ///Title of game
    /// - remark: So far this has been identical to ``gameTitle``
    private var title_DTO : String?
    
    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    private var forumTopicID_DTO : PHPHelper.PHPInt?
    
    ///ID Number string for console
    private var consoleID_DTO : PHPHelper.PHPInt?
    
    ///String name for console
    /// - remark: So far this has been identical to ``console``
    private var consoleName_DTO : String?
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    private var flags_DTO : PHPHelper.PHPInt?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``gameIcon``
    private var imageIcon_DTO : String?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    /// - remark: So far this has been identical to ``imageIcon``
    private var gameIcon_DTO : String?
    
    ///partial path struing to title screen image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageTitle_DTO : String?
    
    ///partial path string to gameplay screenshot image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageInGame_DTO : String?
    
    ///partial path string to box art image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageBoxArt_DTO : String?
    
    ///String of publisher for a game
    /// - note: This is different for hacked games.
    private var publisher_DTO : String?
    
    ///String of developer for a game
    /// - note: This is different for hacked games.
    private var developer_DTO : String?
    
    ///genre string for a game
    /// - note: These genre's are not well maintained and are not consistent.
    private var genre_DTO : String?
    
    ///release date string for a game
    /// - note: The format of dates vary and often there are multiple.
    private var released_DTO : String?
    
    ///Title of game
    /// - remark: So far this has been identical to ``gameTitle``
    private var gameTitle_DTO : String?
    
    ///String name for console
    /// - remark: So far this has been identical to ``consoleName``
    private var console_DTO : String?
    
    enum CodingKeys: String, CodingKey {
        case title_DTO = "Title"
        case forumTopicID_DTO = "ForumTopicID"
        case consoleID_DTO = "ConsoleID"
        case consoleName_DTO = "ConsoleName"
        case flags_DTO = "Flags"
        case imageIcon_DTO = "ImageIcon"
        case gameIcon_DTO = "GameIcon"
        case imageTitle_DTO = "ImageTitle"
        case imageInGame_DTO = "ImageIngame"
        case imageBoxArt_DTO = "ImageBoxArt"
        case publisher_DTO = "Publisher"
        case developer_DTO = "Developer"
        case genre_DTO = "Genre"
        case released_DTO = "Released"
        case gameTitle_DTO = "GameTitle"
        case console_DTO = "Console"
    }
    
    public static func == (lhs: Game_DTO, rhs: Game_DTO) -> Bool {
        return lhs.title_DTO == rhs.title_DTO &&
            lhs.forumTopicID_DTO == rhs.forumTopicID_DTO &&
            lhs.consoleID_DTO == rhs.consoleID_DTO &&
            lhs.consoleName_DTO == rhs.consoleName_DTO &&
            lhs.flags_DTO == rhs.flags_DTO &&
            lhs.imageIcon_DTO == rhs.imageIcon_DTO &&
            lhs.gameIcon_DTO == rhs.gameIcon_DTO &&
            lhs.imageTitle_DTO == rhs.imageTitle_DTO &&
            lhs.imageInGame_DTO == rhs.imageInGame_DTO &&
            lhs.imageBoxArt_DTO == rhs.imageBoxArt_DTO &&
            lhs.publisher_DTO == rhs.publisher_DTO &&
            lhs.developer_DTO == rhs.developer_DTO &&
            lhs.genre_DTO == rhs.genre_DTO &&
            lhs.released_DTO == rhs.released_DTO &&
            lhs.gameTitle_DTO == rhs.gameTitle_DTO &&
            lhs.console_DTO == rhs.console_DTO
    }
}

extension Game_DTO: Game, Console, GameExtended {
    public var gameID: Int? {
        nil
    }
    
    public var title: String {
        self.gameTitle_DTO!
    }
    
    public var consoleID: Int? {
        self.consoleID_DTO!.value!
    }
    
    public var consoleName: String {
        self.consoleName_DTO!
    }
    
    public var forumTopicID: Int {
        self.forumTopicID_DTO!.value!
    }
    
    public var flags: Int {
        self.flags_DTO!.value!
    }
    
    public var imageIconURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageIcon_DTO!)!
    }
    
    public var imageTitleURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageTitle_DTO!)!
    }
    
    public var imageInGameURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageInGame_DTO!)!
    }
    
    public var imageBoxArtURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageBoxArt_DTO!)!
    }
    
    public var publisher: String {
        self.publisher_DTO!
    }
    
    public var developer: String {
        self.developer_DTO!
    }
    
    public var genre: String {
        self.genre_DTO!
    }
    
    public var releaseDate: String {
        self.released_DTO!
    }
    
}
