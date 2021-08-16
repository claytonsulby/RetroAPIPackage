//
//  GameInfo.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

import Foundation

public typealias GamesInfo_DTO = [Game_DTO]

public struct Game_DTO : Codable, Equatable {
    public init(name: String? = nil, forumTopicID: String? = nil, consoleID: String? = nil, consoleName: String? = nil, flags: String? = nil, imageIcon: String? = nil, gameIcon: String? = nil, imageTitle: String? = nil, imageInGame: String? = nil, imageBoxArt: String? = nil, publisher: String? = nil, developer: String? = nil, genre: String? = nil, releaseYear: String? = nil, gameTitle: String? = nil, console: String? = nil) {
        self.name = name
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
        self.releaseYear = releaseYear
        self.gameTitle = gameTitle
        self.console = console
    }
    
    public var name:String?
    public var forumTopicID:String?
    public var consoleID:String?
    public var consoleName:String?
    public var flags:String?
    public var imageIcon:String?
    public var gameIcon:String?
    public var imageTitle:String?
    public var imageInGame:String?
    public var imageBoxArt:String?
    public var publisher:String?
    public var developer:String?
    public var genre:String?
    public var releaseYear:String?
    public var gameTitle:String?
    public var console:String?
    
    enum CodingKeys: String, CodingKey {
        case name = "Title"
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
        case releaseYear = "Released"
        case gameTitle = "GameTitle"
        case console = "Console"
    }
    
    public static func == (lhs: Game_DTO, rhs: Game_DTO) -> Bool {
        return lhs.name == rhs.name &&
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
            lhs.releaseYear == rhs.releaseYear &&
            lhs.gameTitle == rhs.gameTitle &&
            lhs.console == rhs.console
    }
}
