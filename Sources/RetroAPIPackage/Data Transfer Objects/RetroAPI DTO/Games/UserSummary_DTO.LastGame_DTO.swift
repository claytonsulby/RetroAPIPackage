//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/12/21.
//

import Foundation

public extension UserSummary_DTO {
    
    public struct LastGame_DTO: Codable {
        public var gameID: Int
        public var title: String
        public var consoleID, forumTopicID, flags: Int
        public var publisher, developer, genre, releasedDate: String?
        public var isFinal: Bool
        public var consoleName, richPresencePatch: String
        
        private var _imageIcon, _imageTitle, _imageInGame, _imageBoxArt: String
        
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
            case releasedDate = "Released"
            case isFinal = "IsFinal"
            case consoleName = "ConsoleName"
            case richPresencePatch = "RichPresencePatch"
        }
    }
    
}
