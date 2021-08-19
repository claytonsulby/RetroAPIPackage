//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {
    
    // MARK: - Console
    public struct Game_DTO: Codable {
        private var gameID_DTO: PHPHelper.PHPInt
        private var title_DTO: String
        
        enum CodingKeys: String, CodingKey {
            case gameID_DTO = "ID"
            case title_DTO = "Title"
        }
    }
}

extension AchievementOfTheWeek_DTO.Game_DTO : Game {
    public var gameID: Int? {
        self.gameID_DTO.value ?? -1
    }
    
    public var title: String {
        self.title_DTO
    }
}
