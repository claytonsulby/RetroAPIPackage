//
//  GameInfo.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

//{"Title":"Virtual Pinball","ForumTopicID":"4989","ConsoleID":"1","ConsoleName":"Mega Drive","Flags":"0","ImageIcon":"\/Images\/018055.png","GameIcon":"\/Images\/018055.png","ImageTitle":"\/Images\/018053.png","ImageIngame":"\/Images\/018054.png","ImageBoxArt":"\/Images\/018052.png","Publisher":"Electronic Arts","Developer":"BudgeCo. Inc","Genre":"Pinball, Simulation","Released":"1993","GameTitle":"Virtual Pinball","Console":"Mega Drive"}

import Foundation

public typealias GamesInfo_DTO = [GameInfo_DTO]


public struct GameInfo_DTO : Hashable, Decodable {
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
}
