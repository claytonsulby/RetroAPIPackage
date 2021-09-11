// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct GameInfoAndUserProgress_DTO: Codable, Equatable {
    public init(gameID: Int = 0, title: String = "", forumTopicID: Int = 0, flags: Int = 0, consoleID: Int = 0, consoleName: String = "", publisher: String? = nil, developer: String? = nil, genre: String? = nil, isFinal: Bool = false, richPresencePatch: String = "", numAchievements: Int? = nil, numAwardedToUser: Int? = nil, numAwardedToUserHardcore: Int? = nil, _numDistinctPlayersCasual: StringCodableMap<Int> = StringCodableMap(-1), _numDistinctPlayersHardcore: StringCodableMap<Int> = StringCodableMap(-1), _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray = .anythingArray([]), _released: String = "", _imageIcon: String = "", _imageTitle: String = "", _imageInGame: String = "", _imageBoxArt: String = "", _userCompletion: NilConditionalDecode<String> = NilConditionalDecode(""), _userCompletionHardcore: NilConditionalDecode<String> = NilConditionalDecode("")) {
        self.gameID = gameID
        self.title = title
        self.forumTopicID = forumTopicID
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
        self._released = _released
        self._imageIcon = _imageIcon
        self._imageTitle = _imageTitle
        self._imageInGame = _imageInGame
        self._imageBoxArt = _imageBoxArt
        self._userCompletion = _userCompletion
        self._userCompletionHardcore = _userCompletionHardcore
    }
    

    public var gameID: Int
    public var title: String
    public var forumTopicID, flags: Int
    public var consoleID: Int
    public var consoleName: String
    public var publisher, developer, genre: String?
    public var isFinal: Bool
    public var richPresencePatch: String
    public var numAchievements: Int?
    public var numAwardedToUser, numAwardedToUserHardcore: Int?
    
    //Privatized for Type change
    private var _numDistinctPlayersCasual, _numDistinctPlayersHardcore: StringCodableMap<Int>
    
    
    public var numDistinctPlayers: Int {
        get { return _numDistinctPlayersCasual.decoded }
        set { _numDistinctPlayersCasual.decoded = newValue }
    }
    
    public var numDistinctPlayersHardcore: Int {
        get { return _numDistinctPlayersHardcore.decoded }
        set { _numDistinctPlayersHardcore.decoded = newValue }
    }
    
    //Privatized for Ease of use
    private var _achievements: GameInfoAndUserProgress_DTO.DictOrEmptyArray
    
    public var achievements:[String: GameInfoAndUserProgress_DTO.Achievement_DTO]? {
        get { return _achievements.value }
        set { _achievements = .anythingDict(newValue ?? [:]) }
    }
    
    private var _released:String
    private var _imageIcon, _imageTitle, _imageInGame, _imageBoxArt: String
    
    //String when success, Int when fail (0)
    private var _userCompletion, _userCompletionHardcore: NilConditionalDecode<String>
    
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
            lhs._released == rhs._released &&
            lhs._imageIcon == rhs._imageIcon &&
            lhs._imageTitle == rhs._imageTitle &&
            lhs._imageInGame == rhs._imageInGame &&
            lhs._imageBoxArt == rhs._imageBoxArt &&
            lhs.userCompletion == rhs.userCompletion &&
            lhs.userCompletionHardcore == rhs.userCompletionHardcore
    }

}

extension GameInfoAndUserProgress_DTO {

    public var imageIconURL: URL? {

        URL(string: RetroAPI.baseImageURL + _imageIcon)
        
    }

    public var imageTitleURL: URL? {

        URL(string: RetroAPI.baseImageURL + _imageTitle)

    }

    public var imageInGameURL: URL? {

        URL(string: RetroAPI.baseImageURL + _imageInGame)
    }

    public var imageBoxArtURL: URL? {

        URL(string: RetroAPI.baseImageURL + _imageBoxArt)
    }
    
    public var releaseDate: String? {
        self._released
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
    
//
//    public var gameID: Int? {
//        self.gameID_DTO ?? -1
//    }
//
//    public var title: String {
//        self.title_DTO ?? ""
//    }
//
//    public var consoleID: Int? {
//        self.consoleID_DTO ?? -1
//    }
//
//    public var consoleName: String {
//        self.consoleName_DTO ?? ""
//    }
//
//    public var forumTopicID: Int {
//        self.forumTopicID_DTO ?? -1
//    }
//
//    public var flags: Int {
//        self.flags_DTO ?? -1
//    }
//
//    public var imageIconURL: URL? {
//
//        if let imageIconURL = self.imageIcon_DTO {
//            return URL(string: RetroAPI.baseImageURL + imageIconURL)
//        } else {
//            return nil
//        }
//    }
//
//    public var imageTitleURL: URL? {
//
//        if let imageTitleURL = self.imageTitle_DTO {
//            return URL(string: RetroAPI.baseImageURL + imageTitleURL)
//        } else {
//            return nil
//        }
//
//    }
//
//    public var imageInGameURL: URL? {
//
//        if let imageInGameURL = self.imageInGame_DTO {
//            return URL(string: RetroAPI.baseImageURL + imageInGameURL)
//        } else {
//            return nil
//        }
//    }
//
//    public var imageBoxArtURL: URL? {
//
//        if let imageBoxArtURL = self.imageBoxArt_DTO {
//            return URL(string: RetroAPI.baseImageURL + imageBoxArtURL)
//        } else {
//            return nil
//        }
//    }
//
//    public var publisher: String {
//        self.publisher_DTO ?? ""
//    }
//
//    public var developer: String {
//        self.developer_DTO ?? ""
//    }
//
//    public var genre: String {
//        self.genre_DTO ?? ""
//    }
//
//    public var releaseDate: String {
//        self.released_DTO ?? ""
//    }
//
//    public var isFinal: Bool {
//        Bool(exactly: self.isFinal_DTO! as NSNumber) ?? false
//
//    }
//
//    public var richPresencePatch: String {
//        self.richPresencePatch_DTO ?? ""
//    }
//
//    public var numAchievements: Int {
//        self.numAchievements_DTO ?? -1
//    }
//
//    public var numDistinctPlayers: Int {
//        Int(self.numDistinctPlayersCasual_DTO ?? "") ?? -1
//    }
//
//    public var numDistinctPlayersHardcore: Int {
//        Int(self.numDistinctPlayersHardcore_DTO ?? "") ?? -1
//    }
//
//    public var achievements: Dictionary<String, GameInfoAndUserProgress_DTO.Achievement_DTO> {
//        self.achievements_DTO?.value ?? [:]
//    }
//
//    public var userCompletionPercentage: Double? {
//
//        if let userCompletion = self.userCompletion_DTO {
//            return Double(userCompletion.replacingOccurrences(of: "%", with: "")) ?? 0 / 100
//        } else {
//            return nil
//        }
//    }
//
//    public var userCompletionHardcorePercentage: Double? {
//
//        if let userCompletionHardcore = self.userCompletionHardcore_DTO {
//            return Double(userCompletionHardcore.replacingOccurrences(of: "%", with: "")) ?? 0 / 100
//        } else {
//            return nil
//        }
//    }
//
//    public var possibleScore: Int? {
//        self.achievements.map { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
//            value.points
//        }.reduce(0, +)
//    }
//
//    public var awardedScore: Int? {
//        self.achievements.compactMap { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
//            if value.isAwarded {
//                return value.points
//            } else {
//                return nil
//            }
//        }.reduce(0, +)
//    }
//
//    public var numAwardedAchievements: Int {
//        self.numAwardedToUser_DTO ?? -1
//    }
//
//    public var numPossibleAchievements: Int? {
//        self.numAchievements_DTO ?? -1
//    }
//
//    public var hardcoreModeEnabled: Bool? {
//        nil
//    }
//
    
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
