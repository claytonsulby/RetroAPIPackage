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
        public init(consoleName: String = "", title: String = "", _imageIcon: String = "", _lastPlayed: String = "", gameID: Int = 0, consoleID: Int = 0, _myVote: String? = nil) {
            self.consoleName = consoleName
            self.title = title
            self._imageIcon = _imageIcon
            self._lastPlayed = _lastPlayed
            self.gameID = gameID
            self.consoleID = consoleID
            self._myVote = _myVote
        }
        

        public var consoleName, title: String
        
        private var _imageIcon, _lastPlayed: String
        public var gameID, consoleID: Int
        private var _myVote:String?

        public var imageIconURL: URL? {

            if _imageIcon == "/Images/000001.png" {
                return nil
            } else {
                return URL(string: RetroAPI.baseImageURL + _imageIcon)
            }
            
        }
        
        public var lastPlayed: Date? {
            DateFormatter.date(fromString: self._lastPlayed)
        }
        
        public var myVote:Int? {
            if let myVote = _myVote {
                return Int(myVote)
            } else {
                return nil
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case gameID = "GameID"
            case consoleID = "ConsoleID"
            case consoleName = "ConsoleName"
            case title = "Title"
            case _imageIcon = "ImageIcon"
            case _lastPlayed = "LastPlayed"
            case _myVote = "MyVote"
        }
        
        public static func == (lhs: UserSummary_DTO.Game_DTO, rhs: UserSummary_DTO.Game_DTO) -> Bool {
            return lhs.consoleName == rhs.consoleName &&
                lhs.title == rhs.title &&
//                lhs.imageIcon == rhs.imageIcon &&
                lhs.lastPlayed == rhs.lastPlayed &&
                lhs.gameID == rhs.gameID &&
                lhs.consoleID == rhs.consoleID &&
                lhs.myVote == rhs.myVote
        }
    }
    
}

extension UserSummary_DTO.Game_DTO : Hashable {
    
}
