//
//  GameInfo.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

//{"Title":"Virtual Pinball","ForumTopicID":"4989","ConsoleID":"1","ConsoleName":"Mega Drive","Flags":"0","ImageIcon":"\/Images\/018055.png","GameIcon":"\/Images\/018055.png","ImageTitle":"\/Images\/018053.png","ImageIngame":"\/Images\/018054.png","ImageBoxArt":"\/Images\/018052.png","Publisher":"Electronic Arts","Developer":"BudgeCo. Inc","Genre":"Pinball, Simulation","Released":"1993","GameTitle":"Virtual Pinball","Console":"Mega Drive"}

import Foundation

typealias GamesInfo_DTO = [GameInfo_DTO]


struct GameInfo_DTO : Hashable, Decodable {
    var name:String?
    var forumTopicID:String?
    var consoleID:String?
    var consoleName:String?
    var flags:String?
    var imageIcon:String?
    var gameIcon:String?
    var imageTitle:String?
    var imageInGame:String?
    var imageBoxArt:String?
    var publisher:String?
    var developer:String?
    var genre:String?
    var releaseYear:String?
    var gameTitle:String?
    var console:String?
    
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
