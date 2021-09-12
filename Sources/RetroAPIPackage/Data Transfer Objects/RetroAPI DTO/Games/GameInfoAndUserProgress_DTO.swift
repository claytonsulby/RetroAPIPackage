// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct GameInfoAndUserProgress_DTO: Codable, Equatable {
    public init(gameID: Int = 0, title: String = "", _forumTopicID: Int = 0, flags: Int = 0, consoleID: Int = 0, consoleName: String = "", publisher: String? = nil, developer: String? = nil, genre: String? = nil, isFinal: Bool = false, richPresencePatch: String = "", numAchievements: Int? = nil, numAwardedToUser: Int? = nil, numAwardedToUserHardcore: Int? = nil, _numDistinctPlayersCasual: DecodeNilUnless<String> = DecodeNilUnless(""), _numDistinctPlayersHardcore: DecodeNilUnless<String> = DecodeNilUnless(""), _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray = .anythingArray([]), releaseDate: String = "", _imageIcon: String = "", _imageTitle: String = "", _imageInGame: String = "", _imageBoxArt: String = "", _userCompletion: DecodeNilUnless<String> = DecodeNilUnless(""), _userCompletionHardcore: DecodeNilUnless<String> = DecodeNilUnless("")) {
        self.gameID = gameID
        self.title = title
        self._forumTopicID = _forumTopicID
        self.flags = flags
        self.consoleID = consoleID
        self.consoleName = consoleName
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self.isFinal = isFinal
        self.richPresencePatch = richPresencePatch
        self.numAchievements = numAchievements
        self.numAwardedToUser = numAwardedToUser
        self.numAwardedToUserHardcore = numAwardedToUserHardcore
        self._numDistinctPlayersCasual = _numDistinctPlayersCasual
        self._numDistinctPlayersHardcore = _numDistinctPlayersHardcore
        self._achievements = _achievements
        self.releaseDate = releaseDate
        self._imageIcon = _imageIcon
        self._imageTitle = _imageTitle
        self._imageInGame = _imageInGame
        self._imageBoxArt = _imageBoxArt
        self._userCompletion = _userCompletion
        self._userCompletionHardcore = _userCompletionHardcore
    }
    

    public var gameID: Int
    public var title: String
    public var flags: Int
    public var consoleID: Int
    public var consoleName: String
    public var publisher, developer, genre: String?
    public var isFinal: Bool
    public var richPresencePatch: String
    public var numAchievements: Int?
    public var numAwardedToUser, numAwardedToUserHardcore: Int?
    
    private var _forumTopicID: Int
    
    public var forumTopicID: Int? {
        if _forumTopicID == 0 {
            return nil
        } else {
            return _forumTopicID
        }
    }
    
    //Privatized for Type change
    //FIXME: is string on succeed (and converted to int), is int if fail. Need to convert int decode to failure or catch type mismatch and return nil
    //Example: https://retroachievements.org/game/1126
    private var _numDistinctPlayersCasual, _numDistinctPlayersHardcore: DecodeNilUnless<String>
    
    
    public var numDistinctPlayers: Int {
        get { return Int(_numDistinctPlayersCasual.decoded ?? "") ?? 0 }
        set { _numDistinctPlayersCasual.decoded = String(newValue) }
    }
    
    public var numDistinctPlayersHardcore: Int {
        get { return Int(_numDistinctPlayersHardcore.decoded ?? "") ?? 0  }
        set { _numDistinctPlayersHardcore.decoded = String(newValue) }
    }
    
    //Privatized for Ease of use
    private var _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray
    
    public var achievements:[String: GameInfoAndUserProgress_DTO.Achievement_DTO]? {
        get { return _achievements.value }
        set { _achievements = .anythingDict(newValue ?? [:]) }
    }
    
    public var releaseDate:String?
    private var _imageIcon, _imageTitle, _imageInGame, _imageBoxArt: String
    
    //String when success, Int when fail (0)
    private var _userCompletion, _userCompletionHardcore: DecodeNilUnless<String>
    
    public var userCompletion: Double? {

        get {
            if let userCompletion = _userCompletion.decoded {
                return Double(userCompletion.replacingOccurrences(of: "%", with: "")) ?? 0 / 100
            } else {
                return nil
            }
        } set {
            //FIXME: should not have a default value, instead assign nil
            _userCompletion.decoded = String(newValue ?? -1)
        }
        
    }

    public var userCompletionHardcore: Double? {

        get {
            if let userCompletionHardcore = _userCompletionHardcore.decoded {
                return Double(userCompletionHardcore.replacingOccurrences(of: "%", with: "")) ?? 0 / 100
            } else {
                return nil
            }
        } set {
            //FIXME: should not have a default value, instead assign nil
            _userCompletionHardcore.decoded = String(newValue ?? -1)
        }
    }

    enum CodingKeys: String, CodingKey {
        case gameID = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case _forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case _imageIcon = "ImageIcon"
        case _imageTitle = "ImageTitle"
        case _imageInGame = "ImageIngame"
        case _imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case releaseDate = "Released"
        case isFinal = "IsFinal"
        case consoleName = "ConsoleName"
        case richPresencePatch = "RichPresencePatch"
        case numAchievements = "NumAchievements"
        case _numDistinctPlayersCasual = "NumDistinctPlayersCasual"
        case _numDistinctPlayersHardcore = "NumDistinctPlayersHardcore"
        case _achievements = "Achievements"
        case numAwardedToUser = "NumAwardedToUser"
        case numAwardedToUserHardcore = "NumAwardedToUserHardcore"
        case _userCompletion = "UserCompletion"
        case _userCompletionHardcore = "UserCompletionHardcore"
    }
    
    public static func == (lhs: GameInfoAndUserProgress_DTO, rhs: GameInfoAndUserProgress_DTO) -> Bool {
        return lhs.gameID == rhs.gameID &&
            lhs.title == rhs.title &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs.consoleID == rhs.consoleID &&
            lhs.consoleName == rhs.consoleName &&
            lhs.publisher == rhs.publisher &&
            lhs.developer == rhs.developer &&
            lhs.genre == rhs.genre &&
            lhs.isFinal == rhs.isFinal &&
            lhs.richPresencePatch == rhs.richPresencePatch &&
            lhs.numAchievements == rhs.numAchievements &&
            lhs.numAwardedToUser == rhs.numAwardedToUser &&
            lhs.numAwardedToUserHardcore == rhs.numAwardedToUserHardcore &&
            lhs.numDistinctPlayers == rhs.numDistinctPlayers &&
            lhs.numDistinctPlayersHardcore == rhs.numDistinctPlayersHardcore &&
            lhs._achievements == rhs._achievements &&
            lhs.releaseDate == rhs.releaseDate &&
            lhs._imageIcon == rhs._imageIcon &&
            lhs._imageTitle == rhs._imageTitle &&
            lhs._imageInGame == rhs._imageInGame &&
            lhs._imageBoxArt == rhs._imageBoxArt &&
            lhs.userCompletion == rhs.userCompletion &&
            lhs.userCompletionHardcore == rhs.userCompletionHardcore
    }

}

extension GameInfoAndUserProgress_DTO: GameMetadata {

    public var imageIconURL: URL? {

        if _imageIcon.hasSuffix("000001.png") {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageIcon)
        }
        
    }

    public var imageTitleURL: URL? {

        if _imageTitle.hasSuffix("000002.png") {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageTitle)
        }

    }

    public var imageInGameURL: URL? {

        if _imageInGame.hasSuffix("000002.png") {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageInGame)
        }
        
    }

    public var imageBoxArtURL: URL? {

        if _imageBoxArt.hasSuffix("000002.png") {
            return nil
        } else {
            return URL(string: RetroAPI.baseImageURL + _imageBoxArt)
        }
        
    }
    public var possibleScore: Int? {
        self._achievements.value?.compactMap { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
            value.points
        }.reduce(0, +)
    }

    public var awardedScore: Int? {
        self._achievements.value?.compactMap { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
            if value.isAwarded {
                return value.points
            } else {
                return nil
            }
        }.reduce(0, +)
    }
}


public extension GameInfoAndUserProgress_DTO {
    
    public enum DictOrEmptyArray: Codable, Equatable {

        case anythingDict([String: GameInfoAndUserProgress_DTO.Achievement_DTO])
        case anythingArray([JSONAny])

        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([String: GameInfoAndUserProgress_DTO.Achievement_DTO].self) {
                self = .anythingDict(x)
                return
            }
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            throw DecodingError.typeMismatch(GameInfoAndUserProgress_DTO.Achievement_DTO.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Achievements"))
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

        public var value:[String: GameInfoAndUserProgress_DTO.Achievement_DTO]? {
            switch self {
            case .anythingDict(let x):
                return x
            case .anythingArray(_):
                return nil
            }

        }
        
        public static func == (lhs: GameInfoAndUserProgress_DTO.DictOrEmptyArray, rhs: GameInfoAndUserProgress_DTO.DictOrEmptyArray) -> Bool {
            return lhs.value == rhs.value
        }

    }
    
}

