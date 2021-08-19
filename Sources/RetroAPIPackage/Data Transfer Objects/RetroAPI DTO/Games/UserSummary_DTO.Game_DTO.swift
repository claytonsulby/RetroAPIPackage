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

extension UserSummary_DTO.Game_DTO: Game, Console, GameIcon, RecentlyPlayed {
    public var gameID: Int? {
        self.gameID_DTO?.value ?? -1
    }
    
    public var title: String {
        self.title_DTO ?? ""
    }
    
    public var consoleID: Int? {
        self.consoleID_DTO?.value ?? -1
    }
    
    public var consoleName: String {
        self.consoleName_DTO ?? ""
    }
    
    public var imageIconURL: URL? {
        
        if let imageIconURL = self.imageIcon_DTO {
            return URL(string: RetroAPI.baseImageURL + imageIconURL)
        } else {
            return nil
        }
    }
    
    public var lastPlayed: Date {
        
        if let lastPlayed = self.lastPlayed_DTO {
            return DateFormatter.standardFormat(from: lastPlayed) ?? Date(timeIntervalSince1970: 0)
        } else {
            return Date(timeIntervalSince1970: 0)
        }

    }
    
    public var userSubmittedRating: Int? {
        if let myVote = self.myVote_DTO {
            return myVote.value ?? -1
        } else {
            return nil
        }
    }
    
}
