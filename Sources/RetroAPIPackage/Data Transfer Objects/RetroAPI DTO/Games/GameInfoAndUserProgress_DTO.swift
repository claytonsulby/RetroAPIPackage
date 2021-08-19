// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct GameInfoAndUserProgress_DTO: Codable, Equatable {
    public init(gameID_DTO: PHPHelper.PHPInt? = nil, title_DTO: String? = nil, consoleID_DTO: PHPHelper.PHPInt? = nil, forumTopicID_DTO: PHPHelper.PHPInt? = nil, flags_DTO: PHPHelper.PHPInt? = nil, imageIcon_DTO: String? = nil, imageTitle_DTO: String? = nil, imageInGame_DTO: String? = nil, imageBoxArt_DTO: String? = nil, publisher_DTO: String? = nil, developer_DTO: String? = nil, genre_DTO: String? = nil, released_DTO: String? = nil, isFinal_DTO: Bool? = nil, consoleName_DTO: String? = nil, richPresencePatch_DTO: String? = nil, numAchievements_DTO: PHPHelper.PHPInt? = nil, numDistinctPlayersCasual_DTO: PHPHelper.PHPInt? = nil, numDistinctPlayersHardcore_DTO: PHPHelper.PHPInt? = nil, achievements_DTO: GameInfoAndUserProgress_DTO.DictOrEmptyArray? = nil, numAwardedToUser_DTO: PHPHelper.PHPInt? = nil, numAwardedToUserHardcore_DTO: PHPHelper.PHPInt? = nil, userCompletion_DTO: String? = nil, userCompletionHardcore_DTO: String? = nil) {
        self.gameID_DTO = gameID_DTO
        self.title_DTO = title_DTO
        self.consoleID_DTO = consoleID_DTO
        self.forumTopicID_DTO = forumTopicID_DTO
        self.flags_DTO = flags_DTO
        self.imageIcon_DTO = imageIcon_DTO
        self.imageTitle_DTO = imageTitle_DTO
        self.imageInGame_DTO = imageInGame_DTO
        self.imageBoxArt_DTO = imageBoxArt_DTO
        self.publisher_DTO = publisher_DTO
        self.developer_DTO = developer_DTO
        self.genre_DTO = genre_DTO
        self.released_DTO = released_DTO
        self.isFinal_DTO = isFinal_DTO
        self.consoleName_DTO = consoleName_DTO
        self.richPresencePatch_DTO = richPresencePatch_DTO
        self.numAchievements_DTO = numAchievements_DTO
        self.numDistinctPlayersCasual_DTO = numDistinctPlayersCasual_DTO
        self.numDistinctPlayersHardcore_DTO = numDistinctPlayersHardcore_DTO
        self.achievements_DTO = achievements_DTO
        self.numAwardedToUser_DTO = numAwardedToUser_DTO
        self.numAwardedToUserHardcore_DTO = numAwardedToUserHardcore_DTO
        self.userCompletion_DTO = userCompletion_DTO
        self.userCompletionHardcore_DTO = userCompletionHardcore_DTO
    }
    

    private var gameID_DTO: PHPHelper.PHPInt?
    private var title_DTO: String?
    private var consoleID_DTO, forumTopicID_DTO, flags_DTO: PHPHelper.PHPInt?
    private var imageIcon_DTO, imageTitle_DTO, imageInGame_DTO, imageBoxArt_DTO: String?
    private var publisher_DTO, developer_DTO, genre_DTO, released_DTO: String?
    private var isFinal_DTO: Bool?
    private var consoleName_DTO, richPresencePatch_DTO: String?
    private var numAchievements_DTO: PHPHelper.PHPInt?
    private var numDistinctPlayersCasual_DTO, numDistinctPlayersHardcore_DTO: PHPHelper.PHPInt?
    private var achievements_DTO: GameInfoAndUserProgress_DTO.DictOrEmptyArray?
    private var numAwardedToUser_DTO, numAwardedToUserHardcore_DTO: PHPHelper.PHPInt?
    private var userCompletion_DTO, userCompletionHardcore_DTO: String?

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
        case numAwardedToUser_DTO = "NumAwardedToUser"
        case numAwardedToUserHardcore_DTO = "NumAwardedToUserHardcore"
        case userCompletion_DTO = "UserCompletion"
        case userCompletionHardcore_DTO = "UserCompletionHardcore"
    }
}

extension GameInfoAndUserProgress_DTO: Game, GameExtended, GameImage, Console, AchievementSet, GameProgress  {
    public var gameID: Int? {
        self.gameID_DTO!.value!
    }
    
    public var title: String {
        self.title_DTO!
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
    
    public var achievements: Dictionary<String, GameInfoAndUserProgress_DTO.Achievement_DTO> {
        self.achievements_DTO!.value!
    }
    
    public var userCompletionPercentage: Double? {
        Double(self.userCompletion_DTO!.replacingOccurrences(of: "%", with: ""))! / 100
    }
    
    public var userCompletionHardcorePercentage: Double? {
        Double(self.userCompletionHardcore_DTO!.replacingOccurrences(of: "%", with: ""))! / 100
    }
    
    public var possibleScore: Int? {
        self.achievements.map { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
            value.points
        }.reduce(0, +)
    }
    
    public var awardedScore: Int? {
        self.achievements.compactMap { (key: String, value: GameInfoAndUserProgress_DTO.Achievement_DTO) in
            if value.isAwarded {
                return value.points
            } else {
                return nil
            }
        }.reduce(0, +)
    }
    
    public var numAwardedAchievements: Int {
        self.numAwardedToUser_DTO!.value!
    }
    
    public var numPossibleAchievements: Int? {
        self.numAchievements_DTO!.value!
    }
    
    public var hardcoreModeEnabled: Bool? {
        nil
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
