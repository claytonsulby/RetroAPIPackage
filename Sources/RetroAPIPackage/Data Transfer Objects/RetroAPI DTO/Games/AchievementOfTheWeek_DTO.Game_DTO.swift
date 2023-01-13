//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {

    struct Game_DTO: Codable, Equatable, Game {
        private var _gameID:String
        
        public var gameID: Int {
            get { return Int(_gameID)! }
            set { _gameID = String(newValue) }
        }
        
        public var title: String
        
        enum CodingKeys: String, CodingKey {
            case _gameID = "ID"
            case title = "Title"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Game_DTO, rhs: AchievementOfTheWeek_DTO.Game_DTO) -> Bool {
            return lhs._gameID == rhs._gameID &&
            lhs.title == rhs.title
        }
    }
}
