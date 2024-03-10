//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension UserSummary_DTO {
    
    // MARK: - RecentlyPlayed
    struct Game_DTO: Codable {

        public let gameID, consoleID: Int
        public let consoleName, title: String
        
        private let _lastPlayed:String?
        private let _imageIcon:String
        
        private let _imageTitle: String
        private let _imageIngame: String
        private let _imageBoxArt: String
        public let achievementsTotal: Int

        enum CodingKeys: String, CodingKey {
            case gameID = "GameID"
            case consoleID = "ConsoleID"
            case consoleName = "ConsoleName"
            case title = "Title"
            case _imageIcon = "ImageIcon"
            case _lastPlayed = "LastPlayed"
            case _imageTitle = "ImageTitle"
            case _imageIngame = "ImageIngame"
            case _imageBoxArt = "ImageBoxArt"
            case achievementsTotal = "AchievementsTotal"
        }

        public var imageIconURL: URL? {
            if _imageIcon == "/Images/000001.png" {
                return nil
            } else {
                return URL(string: RetroAPI.baseImageURL + _imageIcon)
            }
        }
        
        public var imageTitleURL: URL? {
            if _imageIcon == "/Images/000001.png" {
                return nil
            } else {
                return URL(string: RetroAPI.baseImageURL + _imageTitle)
            }
        }
        
        public var imageIngameURL: URL? {
            if _imageIcon == "/Images/000001.png" {
                return nil
            } else {
                return URL(string: RetroAPI.baseImageURL + _imageIngame)
            }
        }
        
        public var imageBoxArtURL: URL? {
            if _imageIcon == "/Images/000001.png" {
                return nil
            } else {
                return URL(string: RetroAPI.baseImageURL + _imageBoxArt)
            }
        }
        
        public var lastPlayed: Date? {
            DateFormatter.date(fromString: self._lastPlayed ?? "")
        }
    }
    
}

extension UserSummary_DTO.Game_DTO : Hashable {}
