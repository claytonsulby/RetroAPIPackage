//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {
    
    // MARK: - Console
    struct Game_DTO: Codable {
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
    }
}
