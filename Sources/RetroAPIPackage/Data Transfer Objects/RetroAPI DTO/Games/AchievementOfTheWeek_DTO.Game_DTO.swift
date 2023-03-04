//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {

    struct Game_DTO: Codable, Equatable, Game {
        public var gameID:Int
        public var title: String
        
        enum CodingKeys: String, CodingKey {
            case gameID = "ID"
            case title = "Title"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Game_DTO, rhs: AchievementOfTheWeek_DTO.Game_DTO) -> Bool {
            return lhs.gameID == rhs.gameID &&
            lhs.title == rhs.title
        }
    }
}
