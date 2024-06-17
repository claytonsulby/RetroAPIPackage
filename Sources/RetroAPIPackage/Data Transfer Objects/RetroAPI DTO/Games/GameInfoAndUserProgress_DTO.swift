// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct GameInfoAndUserProgress_DTO {
    public var gameID: Int
    public var title: String
    public var flags: Int?
    public var consoleID: Int
    public var consoleName: String
    public var publisher, developer, genre: String?
    private var _isFinal:Int?
    public var richPresencePatch: String
    public var numAchievements: Int?
    public var numAwardedToUser, numAwardedToUserHardcore: Int?
    public var forumTopicID: Int?
    private var _numDistinctPlayersCasual, _numDistinctPlayersHardcore: Int?
    private var _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray
    public var releaseDate:String?
    private var _imageIcon, _imageTitle, _imageInGame, _imageBoxArt: String
    private var _userCompletion, _userCompletionHardcore: DecodeNilUnless<String>

}

extension GameInfoAndUserProgress_DTO: Codable {
    enum CodingKeys: String, CodingKey {
        case gameID = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "forumTopicID"
        case flags = "Flags"
        case _imageIcon = "ImageIcon"
        case _imageTitle = "ImageTitle"
        case _imageInGame = "ImageIngame"
        case _imageBoxArt = "ImageBoxArt"
        case publisher = "Publisher"
        case developer = "Developer"
        case genre = "Genre"
        case releaseDate = "Released"
        case _isFinal = "IsFinal"
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
}

extension GameInfoAndUserProgress_DTO: Equatable {
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

extension GameInfoAndUserProgress_DTO {
    
    public init(gameID: Int = 0, title: String = "", forumTopicID: Int = 0, flags: Int? = nil, consoleID: Int = 0, consoleName: String = "", publisher: String? = nil, developer: String? = nil, genre: String? = nil, isFinal: Int? = 0, richPresencePatch: String = "", numAchievements: Int? = nil, numAwardedToUser: Int? = nil, numAwardedToUserHardcore: Int? = nil, _numDistinctPlayersCasual: Int? = nil, _numDistinctPlayersHardcore: Int? = nil, _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray = .anythingArray([]), releaseDate: String = "", _imageIcon: String = "", _imageTitle: String = "", _imageInGame: String = "", _imageBoxArt: String = "", _userCompletion: DecodeNilUnless<String> = DecodeNilUnless(""), _userCompletionHardcore: DecodeNilUnless<String> = DecodeNilUnless("")) {
        self.gameID = gameID
        self.title = title
        self.forumTopicID = forumTopicID
        self.flags = flags
        self.consoleID = consoleID
        self.consoleName = consoleName
        self.publisher = publisher
        self.developer = developer
        self.genre = genre
        self._isFinal = isFinal
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
    
    public var isFinal: Bool {
        return _isFinal ?? 0 == 1
    }
    
    
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
    
    public var numDistinctPlayers: Int {
        get { return _numDistinctPlayersCasual ?? 0 }
        set { _numDistinctPlayersCasual = newValue }
    }
    
    public var numDistinctPlayersHardcore: Int {
        get { return _numDistinctPlayersHardcore ?? 0  }
        set { _numDistinctPlayersHardcore = newValue }
    }

    public var achievements:[GameInfoAndUserProgress_DTO.Achievement_DTO] {
        get {
            if let values = _achievements.value?.values {
                return Array(values)
            } else {
                return []
            }
        }
    }
    
}

public extension GameInfoAndUserProgress_DTO {
    
    enum DictOrEmptyArray: Codable, Equatable {

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

            do {
                let x = try container.decode([String: GameInfoAndUserProgress_DTO.Achievement_DTO].self)
                self = .anythingDict(x)
                return
            } catch DecodingError.dataCorrupted(let context) {
                throw DecodingError.dataCorrupted(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                throw DecodingError.keyNotFound(key, context)
            } catch DecodingError.valueNotFound(let value, let context) {
                throw DecodingError.valueNotFound(value, context)
            } catch DecodingError.typeMismatch(let type, let context) {
                throw DecodingError.typeMismatch(type, context)
            } catch {
                throw error;
            }
            
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

