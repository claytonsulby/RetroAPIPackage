//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension UserSummary_DTO {
    
    // MARK: - RecentAchievement
    public struct Achievement_DTO: Codable, Equatable {
        
        private var achievementID_DTO, gameID_DTO, points_DTO: PHPHelper.PHPInt
        private var gameTitle_DTO, title_DTO: String
        private var achievementDescription_DTO, badgeName_DTO, isAwarded_DTO: String
        private var dateAwarded_DTO, hardcoreAchieved_DTO: String

        enum CodingKeys: String, CodingKey {
            case achievementID_DTO = "ID"
            case gameID_DTO = "GameID"
            case gameTitle_DTO = "GameTitle"
            case title_DTO = "Title"
            case achievementDescription_DTO = "Description"
            case points_DTO = "Points"
            case badgeName_DTO = "BadgeName"
            case isAwarded_DTO = "IsAwarded"
            case dateAwarded_DTO = "DateAwarded"
            case hardcoreAchieved_DTO = "HardcoreAchieved"
        }
        
        public static func == (lhs: UserSummary_DTO.Achievement_DTO, rhs: UserSummary_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID_DTO == rhs.achievementID_DTO &&
                lhs.gameID_DTO == rhs.gameID_DTO &&
                lhs.gameTitle_DTO == rhs.gameTitle_DTO &&
                lhs.title_DTO == rhs.title_DTO &&
                lhs.achievementDescription_DTO == rhs.achievementDescription_DTO &&
                lhs.points_DTO == rhs.points_DTO &&
                lhs.badgeName_DTO == rhs.badgeName_DTO &&
                lhs.isAwarded_DTO == rhs.isAwarded_DTO &&
                lhs.dateAwarded_DTO == rhs.dateAwarded_DTO &&
                lhs.hardcoreAchieved_DTO == rhs.hardcoreAchieved_DTO
        }

    }
    
}

// MARK: - Achievement Protocol Conformance
extension UserSummary_DTO.Achievement_DTO : Achievement, Game, AchievementImage, Awarded {

    public var achievementID: Int {
        self.achievementID_DTO.value!
    }
    
    public var title: String {
        self.title_DTO
    }
    
    public var achievementDescription: String {
        self.achievementDescription_DTO
    }
    
    public var points: Int {
        self.points_DTO.value!
    }
    
    public var gameID: Int? {
        self.gameID_DTO.value!
    }
    
    public var gameTitle: String {
        self.gameTitle_DTO
    }
    
    public var imageURL: URL {
        
        URL(string: RetroAPI.baseBadgeURL + self.badgeName_DTO + ".png")!
        
    }
    
    public var dateAwarded: Date? {
        
        DateFormatter.standardFormat(from: self.dateAwarded_DTO)
        
    }
    
    public var dateAwardedHardcore: Date? {
        
        nil
        
    }
    
    public var isAwarded: Bool {
        
        self.dateAwarded != nil
        
    }
    
    public var isAwardedHardcore: Bool {
        
        Bool(exactly: Int(self.hardcoreAchieved_DTO)! as NSNumber)!
        
    }
    
    
}


