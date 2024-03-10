//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/12/21.
//

import Foundation

public extension UserSummary_DTO {
    
    struct LastGame_DTO: Codable, Equatable {

        public let gameID: Int
        public let title: String
        public let consoleID: Int
        public let consoleName: String
        public let forumTopicID: Int?
        public let flags: Int?
        public let publisher, developer, genre, released: String
        public let isFinal: Int
        
        private var _imageIcon, _imageTitle, _imageInGame, _imageBoxArt: String

        enum CodingKeys: String, CodingKey {
            case gameID = "ID"
            case title = "Title"
            case consoleID = "ConsoleID"
            case consoleName = "ConsoleName"
            case forumTopicID = "ForumTopicID"
            case flags = "Flags"
            case _imageIcon = "ImageIcon"
            case _imageTitle = "ImageTitle"
            case _imageInGame = "ImageIngame"
            case _imageBoxArt = "ImageBoxArt"
            case publisher = "Publisher"
            case developer = "Developer"
            case genre = "Genre"
            case released = "Released"
            case isFinal = "IsFinal"
        }
        
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
    }
    
}
