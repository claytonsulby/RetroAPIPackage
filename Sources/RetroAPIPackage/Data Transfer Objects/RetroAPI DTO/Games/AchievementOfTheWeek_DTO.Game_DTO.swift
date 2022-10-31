//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {
    
    // MARK: - Console
    struct Game_DTO: Codable, Equatable {
        private var _gameID: StringMapTo<Int>
        
        public var gameID: Int {
            get { return _gameID.decoded }
            set { _gameID.decoded = newValue }
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
