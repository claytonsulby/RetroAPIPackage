//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension UserSummary_DTO {
    
    // MARK: - RecentlyPlayed
    struct Game_DTO: Codable, Equatable {

        private var consoleName_DTO, title_DTO: String?
        private var imageIcon_DTO, lastPlayed_DTO: String?
        private var gameID_DTO, consoleID_DTO, myVote_DTO: PHPHelper.PHPInt?
        
        enum CodingKeys: String, CodingKey {
            case gameID_DTO = "GameID"
            case consoleID_DTO = "ConsoleID"
            case consoleName_DTO = "ConsoleName"
            case title_DTO = "Title"
            case imageIcon_DTO = "ImageIcon"
            case lastPlayed_DTO = "LastPlayed"
            case myVote_DTO = "MyVote"
        }
        
        public static func == (lhs: UserSummary_DTO.Game_DTO, rhs: UserSummary_DTO.Game_DTO) -> Bool {
            return lhs.gameID_DTO == rhs.gameID_DTO &&
                lhs.consoleID_DTO == rhs.consoleID_DTO &&
                lhs.consoleName_DTO == rhs.consoleName_DTO &&
                lhs.title_DTO == rhs.title_DTO &&
                lhs.imageIcon_DTO == rhs.imageIcon_DTO &&
                lhs.lastPlayed_DTO == rhs.lastPlayed_DTO &&
                lhs.myVote_DTO == rhs.myVote_DTO
        }
    }
    
}

extension UserSummary_DTO.Game_DTO: Game, Console, GameImage, RecentlyPlayed {
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
    
    public var imageIconURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageIcon_DTO!)!
    }
    
    public var lastPlayed: Date {
        return DateFormatter.standardFormat(from: self.lastPlayed_DTO!)!
    }
    
    public var userSubmittedRating: Int? {
        if let myVote = self.myVote_DTO {
            return myVote.value!
        } else {
            return nil
        }
    }
    
    
}
