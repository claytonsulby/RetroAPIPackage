//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/12/21.
//

import Foundation

public extension UserSummary_DTO {
    
    struct LastGame_DTO: Codable, Equatable {
        public init(gameID: Int = 0, title: String = "", consoleID: Int = 0, forumTopicID: Int? = nil, flags: Int = 0, publisher: String? = nil, developer: String? = nil, genre: String? = nil, releasedDate: String? = nil, isFinal: Bool = false, consoleName: String = "", richPresencePatch: String? = nil, _imageIcon: String = "", _imageTitle: String = "", _imageInGame: String = "", _imageBoxArt: String = "") {
            self.gameID = gameID
            self.title = title
            self.consoleID = consoleID
            self.forumTopicID = forumTopicID
            self.flags = flags
            self.publisher = publisher
            self.developer = developer
            self.genre = genre
            self.releasedDate = releasedDate
            self.isFinal = isFinal
            self.consoleName = consoleName
            self.richPresencePatch = richPresencePatch
            self._imageIcon = _imageIcon
            self._imageTitle = _imageTitle
            self._imageInGame = _imageInGame
            self._imageBoxArt = _imageBoxArt
        }
        
        public var gameID: Int
        public var title: String
        public var forumTopicID:Int?
        public var consoleID, flags: Int
        public var publisher, developer, genre, releasedDate: String?
        public var isFinal: Bool
        public var consoleName: String
        public var richPresencePatch: String?
        
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
        
        public static func == (lhs: UserSummary_DTO.LastGame_DTO, rhs: UserSummary_DTO.LastGame_DTO) -> Bool {
            return lhs.gameID == rhs.gameID &&
                lhs.title == rhs.title &&
                lhs.consoleID == rhs.consoleID &&
                lhs.forumTopicID == rhs.forumTopicID &&
                lhs.flags == rhs.flags &&
                lhs.publisher == rhs.publisher &&
                lhs.developer == rhs.developer &&
                lhs.genre == rhs.genre &&
                lhs.releasedDate == rhs.releasedDate &&
                lhs.isFinal == rhs.isFinal &&
                lhs.consoleName == rhs.consoleName &&
                lhs.richPresencePatch == rhs.richPresencePatch &&
                lhs._imageIcon == rhs._imageIcon &&
                lhs._imageTitle == rhs._imageTitle &&
                lhs._imageInGame == rhs._imageInGame &&
                lhs._imageBoxArt == rhs._imageBoxArt
        }
    }
    
}
