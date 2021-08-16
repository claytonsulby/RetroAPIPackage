// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

public typealias ExtendedGamesInfo_DTO = [GameExtended_DTO]

// MARK: - ExtendedGamesInfo_DTO
public struct GameExtended_DTO: Codable, Equatable {
    public init(id: Int? = nil, title: String? = nil, consoleID: Int? = nil, forumTopicID: Int? = nil, flags: Int? = nil, imageIcon: String? = nil, imageTitle: String? = nil, imageIngame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, released: String? = nil, isFinal: Bool? = nil, consoleName: String? = nil, richPresencePatch: String? = nil, numAchievements: Int? = nil, numDistinctPlayersCasual: PHPHelper.JSONIntOrString? = nil, numDistinctPlayersHardcore: PHPHelper.JSONIntOrString? = nil, achievements: ExtendedGamesInfo_Achievements_DTO? = nil) {
        self.id = id
        self.title = title
        self.consoleID = consoleID
        self.forumTopicID = forumTopicID
        self.flags = flags
        self.imageIcon = imageIcon
        self.imageTitle = imageTitle
        self.imageIngame = imageIngame
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
    
    public var id: Int?
    public var title: String?
    public var consoleID, forumTopicID, flags: Int?
    public var imageIcon, imageTitle, imageIngame, imageBoxArt: String?
    public var publisher, developer, genre, released: String?
    public var isFinal: Bool?
    public var consoleName, richPresencePatch: String?
    public var numAchievements: Int?
    public var numDistinctPlayersCasual, numDistinctPlayersHardcore: PHPHelper.JSONIntOrString?
    public var achievements: ExtendedGamesInfo_Achievements_DTO?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case consoleID = "ConsoleID"
        case forumTopicID = "ForumTopicID"
        case flags = "Flags"
        case imageIcon = "ImageIcon"
        case imageTitle = "ImageTitle"
        case imageIngame = "ImageIngame"
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
        return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.consoleID == rhs.consoleID &&
            lhs.forumTopicID == rhs.forumTopicID &&
            lhs.flags == rhs.flags &&
            lhs.imageIcon == rhs.imageIcon &&
            lhs.imageTitle == rhs.imageTitle &&
            lhs.imageIngame == rhs.imageIngame &&
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

public enum ExtendedGamesInfo_Achievements_DTO: Codable, Equatable {
    case achievementMap([String: Achievement_DTO])
    case anythingArray([JSONAny])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode([String: Achievement_DTO].self) {
            self = .achievementMap(x)
            return
        }
        throw DecodingError.typeMismatch(Achievement_DTO.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Achievements"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .achievementMap(let x):
            try container.encode(x)
        case .anythingArray(let x):
            try container.encode(x)
        }
    }
    
    public static func == (lhs: ExtendedGamesInfo_Achievements_DTO, rhs: ExtendedGamesInfo_Achievements_DTO) -> Bool {
        return lhs.array == rhs.array
    }
    
    public var array:[Achievement_DTO] {
        
        switch self {
        case .achievementMap(let x):
            let achievements = x.map({ (key:String, achievement: Achievement_DTO) -> Achievement_DTO in
                achievement
            })
            return achievements
        case .anythingArray(_):
            return []
        }

    }
    
}
