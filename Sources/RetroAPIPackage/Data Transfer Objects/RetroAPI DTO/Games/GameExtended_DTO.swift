// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - ExtendedGamesInfo_DTO
/// - [Sucees](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
/// - [Failure](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=)
public struct GameExtended_DTO: Codable, Equatable {
    public init(gameID: Int = 0, title: String = "", consoleID: Int = 0, forumTopicID: Int = 0, flags: Int = 0, _imageIcon: String = "", _imageTitle: String = "", _imageInGame: String = "", _imageBoxArt: String = "", publisher: String? = nil, developer: String? = nil, genre: String? = nil, _released: String? = nil, isFinal: Bool = false, consoleName: String = "", richPresencePatch: String = "", numAchievements: Int = 0, _numDistinctPlayersCasual: DecodeNilUnless<String> = DecodeNilUnless(""), _numDistinctPlayersHardcore: DecodeNilUnless<String> = DecodeNilUnless(""), _achievements: GameExtended_DTO.DictOrEmptyArray = .anythingArray([])) {
        self.gameID = gameID
        self.title = title
        self.consoleID = consoleID
        self.forumTopicID = forumTopicID
        self.flags = flags
        self._imageIcon = _imageIcon
        self._imageTitle = _imageTitle
        self._imageInGame = _imageInGame
        self._imageBoxArt = _imageBoxArt
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self._released = _released
        self.isFinal = isFinal
        self.consoleName = consoleName
        self.richPresencePatch = richPresencePatch
        self.numAchievements = numAchievements
        self._numDistinctPlayersCasual = _numDistinctPlayersCasual
        self._numDistinctPlayersHardcore = _numDistinctPlayersHardcore
        self._achievements = _achievements
    }
    
    
    ///Integer identifier for game
    public var gameID: Int
    
    ///Title of game
    public var title: String
    
    ///ID Number string for console
    public var consoleID: Int
    
    ///ID Number string for topic page in forum
    /// - note: This should be concatenated with ``RetroAPI.baseForumURL``
    public var forumTopicID: Int
    
    /// - remark: I have only seen this as null or 0 so far. I do not know what this indicates
    public var flags: Int
    
    ///partial path string to icon image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageIcon: String
    
    ///partial path struing to title screen image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageTitle: String
    
    ///partial path string to gameplay screenshot image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageInGame: String
    
    ///partial path string to box art image for a game
    /// - note: This should be concatenated with ``RetroAPI.baseImageURL``
    private var _imageBoxArt: String
    
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
    private var _released: String?
    
    /// - remark: I do not know what this means, but I assume it indicates if the game will continue to be editted.
    public var isFinal: Bool
    
    ///String name for console
    public var consoleName: String
    
    /// - remark: I am not entirely sure what this signifies.
    public var richPresencePatch: String
    
    ///The number of achievements for the game.
    public var numAchievements: Int
    
    ///The sum total of players who have been awarded an achievement not in hardcore mode.
    private var _numDistinctPlayersCasual: DecodeNilUnless<String>?
    
    ///The sum total of players who have been awarded an achievement in hardcore mode.
    private var _numDistinctPlayersHardcore: DecodeNilUnless<String>?
    
    public var numDistinctPlayers: Int {
        get { return Int(_numDistinctPlayersCasual?.decoded ?? "") ?? 0 }
        set { _numDistinctPlayersCasual?.decoded = String(newValue) }
    }
    
    public var numDistinctPlayersHardcore: Int {
        get { return Int(_numDistinctPlayersHardcore?.decoded ?? "") ?? 0  }
        set { _numDistinctPlayersHardcore?.decoded = String(newValue) }
    }
    
    ///Array of achievements
    private var _achievements: GameExtended_DTO.DictOrEmptyArray
    
    public var achievements:[String: GameExtended_DTO.Achievement_DTO]? {
        get { return _achievements.value }
        set { _achievements = .anythingDict(newValue ?? [:]) }
    }
    
    enum CodingKeys: String, CodingKey {
        case gameID = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case _imageIcon = "ImageIcon"
        case _imageTitle = "ImageTitle"
        case _imageInGame = "ImageIngame"
        case _imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case _released = "Released"
        case isFinal = "IsFinal"
        case consoleName = "ConsoleName"
        case richPresencePatch = "RichPresencePatch"
        case numAchievements = "NumAchievements"
        case _numDistinctPlayersCasual = "NumDistinctPlayersCasual"
        case _numDistinctPlayersHardcore = "NumDistinctPlayersHardcore"
        case _achievements = "Achievements"
    }
    
    public static func == (lhs: GameExtended_DTO, rhs: GameExtended_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.title == rhs.title &&
            lhs.consoleID == rhs.consoleID &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs._imageIcon == rhs._imageIcon &&
            lhs._imageTitle == rhs._imageTitle &&
            lhs._imageInGame == rhs._imageInGame &&
            lhs._imageBoxArt == rhs._imageBoxArt &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs._released == rhs._released &&
            lhs.isFinal == rhs.isFinal &&
            lhs.consoleName == rhs.consoleName &&
            lhs.richPresencePatch == rhs.richPresencePatch &&
            lhs.numAchievements == rhs.numAchievements &&
            lhs.numDistinctPlayers == rhs.numDistinctPlayers &&
            lhs.numDistinctPlayersHardcore == rhs.numDistinctPlayersHardcore &&
            lhs.achievements == rhs.achievements
    }
}

extension GameExtended_DTO : AchievementSet {
    
    public var imageIconURL: URL? {

        if _imageIcon == "/Images/000001.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
        
    }

    public var imageTitleURL: URL? {

        if _imageTitle == "/Images/000002.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageTitle)
        }

    }

    public var imageInGameURL: URL? {

        if _imageInGame == "/Images/000002.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageInGame)
        }
        
    }

    public var imageBoxArtURL: URL? {

        if _imageBoxArt == "/Images/000002.png" {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageBoxArt)
        }
        
    }
    
    public var releaseDate: String? {
        self._released
    }
    
    public var possibleScore: Int? {
        self._achievements.value?.compactMap { (key: String, value: GameExtended_DTO.Achievement_DTO) in
            value.points
        }.reduce(0, +)
    }

    public var awardedScore: Int? {
        self._achievements.value?.compactMap { (key: String, value: GameExtended_DTO.Achievement_DTO) in
            if value.isAwarded {
                return value.points
            } else {
                return nil
            }
        }.reduce(0, +)
    }
    
}

public extension GameExtended_DTO {
    
    enum DictOrEmptyArray: Codable, Equatable {

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
