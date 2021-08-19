// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - ExtendedGamesInfo_DTO
/// - [Sucees](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
/// - [Failure](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=)
public struct GameExtended_DTO: Codable, Equatable {
    
    ///Integer identifier for game
    private var gameID_DTO: PHPHelper.PHPInt?
    
    ///Title of game
    private var title_DTO: String?
    
    ///ID Number string for console
    private var consoleID_DTO: PHPHelper.PHPInt?
    
    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    private var forumTopicID_DTO: PHPHelper.PHPInt?
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    private var flags_DTO: PHPHelper.PHPInt?
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageIcon_DTO: String?
    
    ///partial path struing to title screen image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageTitle_DTO: String?
    
    ///partial path string to gameplay screenshot image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageInGame_DTO: String?
    
    ///partial path string to box art image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var imageBoxArt_DTO: String?
    
    ///String of publisher for a game
    /// - note: This is different for hacked games.
    private var publisher_DTO: String?
    
    ///String of developer for a game
    /// - note: This is different for hacked games.
    private var developer_DTO: String?
    
    ///genre string for a game
    /// - note: These genre's are not well maintained and are not consistent.
    private var genre_DTO: String?
    
    ///release date string for a game
    /// - note: The format of dates vary and often there are multiple.
    private var released_DTO: String?
    
    /// - remark: I do not know what this means, but I assume it indicates if the game will continue to be editted.
    private var isFinal_DTO: Bool?
    
    ///String name for console
    private var consoleName_DTO: String?
    
    /// - remark: I am not entirely sure what this signifies.
    private var richPresencePatch_DTO: String?
    
    ///The number of achievements for the game.
    private var numAchievements_DTO: PHPHelper.PHPInt?
    
    ///The sum total of players who have been awarded an achievement not in hardcore mode.
    private var numDistinctPlayersCasual_DTO: PHPHelper.PHPInt?
    
    ///The sum total of players who have been awarded an achievement in hardcore mode.
    private var numDistinctPlayersHardcore_DTO: PHPHelper.PHPInt?
    
    ///Array of achievements
    private var achievements_DTO: GameExtended_DTO.DictOrEmptyArray?
    
    enum CodingKeys: String, CodingKey {
        case gameID_DTO = "ID"
        case title_DTO = "Title"
        case consoleID_DTO = "ConsoleID"
        case forumTopicID_DTO = "ForumTopicID"
        case flags_DTO = "Flags"
        case imageIcon_DTO = "ImageIcon"
        case imageTitle_DTO = "ImageTitle"
        case imageInGame_DTO = "ImageIngame"
        case imageBoxArt_DTO = "ImageBoxArt"
        case publisher_DTO = "Publisher"
        case developer_DTO = "Developer"
        case genre_DTO = "Genre"
        case released_DTO = "Released"
        case isFinal_DTO = "IsFinal"
        case consoleName_DTO = "ConsoleName"
        case richPresencePatch_DTO = "RichPresencePatch"
        case numAchievements_DTO = "NumAchievements"
        case numDistinctPlayersCasual_DTO = "NumDistinctPlayersCasual"
        case numDistinctPlayersHardcore_DTO = "NumDistinctPlayersHardcore"
        case achievements_DTO = "Achievements"
    }
}

extension GameExtended_DTO : Game, GameExtended, GameImage, Console, AchievementSet {
    
    public var gameID: Int? {
        self.gameID_DTO!.value!
    }
    
    public var title: String {
        self.title_DTO!
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
    
    public var consoleID: Int? {
        self.consoleID_DTO!.value!
    }
    
    public var consoleName: String {
        self.consoleName_DTO!
    }
    
    public var isFinal: Bool {
        Bool(exactly: self.isFinal_DTO! as NSNumber)!
        
    }
    
    public var richPresencePatch: String {
        self.richPresencePatch_DTO!
    }
    
    public var numAchievements: Int {
        self.numAchievements_DTO!.value!
    }
    
    public var numDistinctPlayers: Int {
        self.numDistinctPlayersCasual_DTO!.value!
    }
    
    public var numDistinctPlayersHardcore: Int {
        self.numDistinctPlayersHardcore_DTO!.value!
    }
    
    public var achievements: Dictionary<String, GameExtended_DTO.Achievement_DTO> {
        self.achievements_DTO!.value!
    }
    
}

public extension GameExtended_DTO {
    
    public enum DictOrEmptyArray: Codable, Equatable {

        case anythingDict([String: GameExtended_DTO.Achievement_DTO])
        case anythingArray([JSONAny])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([String: GameExtended_DTO.Achievement_DTO].self) {
                self = .anythingDict(x)
                return
            }
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            throw DecodingError.typeMismatch(GameExtended_DTO.Achievement_DTO.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Achievements"))
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingDict(let x):
                try container.encode(x)
            case .anythingArray(let x):
                try container.encode(x)
            }
        }

        public var value:[String: GameExtended_DTO.Achievement_DTO]? {
            switch self {
            case .anythingDict(let x):
                return x
            case .anythingArray(_):
                return nil
            }

        }
        
        public static func == (lhs: GameExtended_DTO.DictOrEmptyArray, rhs: GameExtended_DTO.DictOrEmptyArray) -> Bool {
            return lhs.value == rhs.value
        }

    }
    
}
