//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension GameExtended_DTO {
    
    //TODO: quick help comments
    public struct Achievement_DTO: Codable, Equatable {
        
        private var achievementID_DTO: PHPHelper.PHPInt
        private var numAwarded_DTO: PHPHelper.PHPInt
        private var numAwardedHardcore_DTO: PHPHelper.PHPInt
        private var title_DTO: String
        private var achievementDescription_DTO: String
        private var points_DTO: PHPHelper.PHPInt
        private var trueRatio_DTO: PHPHelper.PHPInt
        private var author_DTO: String
        private var dateModified_DTO: String
        private var dateCreated_DTO: String
        private var badgeName_DTO: String
        private var displayOrder_DTO: PHPHelper.PHPInt
        private var memAddr_DTO: String
        
        enum CodingKeys: String, CodingKey {
            case achievementID_DTO = "ID"
            case numAwarded_DTO = "NumAwarded"
            case numAwardedHardcore_DTO = "NumAwardedHardcore"
            case title_DTO = "Title"
            case achievementDescription_DTO = "Description"
            case points_DTO = "Points"
            case trueRatio_DTO = "TrueRatio"
            case author_DTO = "Author"
            case dateModified_DTO = "DateModified"
            case dateCreated_DTO = "DateCreated"
            case badgeName_DTO = "BadgeName"
            case displayOrder_DTO = "DisplayOrder"
            case memAddr_DTO = "MemAddr"
        }
        
        public static func == (lhs: GameExtended_DTO.Achievement_DTO, rhs: GameExtended_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID_DTO == rhs.achievementID_DTO &&
                lhs.numAwarded_DTO == rhs.numAwarded_DTO &&
                lhs.numAwardedHardcore_DTO == rhs.numAwardedHardcore_DTO &&
                lhs.title_DTO == rhs.title_DTO &&
                lhs.achievementDescription_DTO == rhs.achievementDescription_DTO &&
                lhs.points_DTO == rhs.points_DTO &&
                lhs.trueRatio_DTO == rhs.trueRatio_DTO &&
                lhs.author_DTO == rhs.author_DTO &&
                lhs.dateModified_DTO == rhs.dateModified_DTO &&
                lhs.dateCreated_DTO == rhs.dateCreated_DTO &&
                lhs.badgeName_DTO == rhs.badgeName_DTO &&
                lhs.displayOrder_DTO == rhs.displayOrder_DTO &&
                lhs.memAddr_DTO == rhs.memAddr_DTO
        }
    }
}

extension GameExtended_DTO.Achievement_DTO : Achievement, ExtendedAchievement, AchievementImage, FromSet {
    public var achievementID: Int {
        self.achievementID_DTO.value ?? -1
    }
    
    public var title: String {
        self.title_DTO
    }
    
    public var achievementDescription: String {
        self.achievementDescription_DTO
    }
    
    public var points: Int {
        self.points_DTO.value ?? -1
    }
    
    public var trueRatio: Int {
        self.trueRatio_DTO.value ?? -1
    }
    
    public var author: String {
        self.author_DTO
    }
    
    public var dateModified: Date {
        
        return DateFormatter.standardFormat(from: self.dateModified_DTO) ?? Date(timeIntervalSince1970: 0)
    }
    
    public var dateCreated: Date {

        return DateFormatter.standardFormat(from: self.dateCreated_DTO) ?? Date(timeIntervalSince1970: 0)
        
    }
    
    public var imageURL: URL? {
        URL(string: RetroAPI.baseBadgeURL + self.badgeName_DTO + ".png")
    }
    
    public var displayOrder: Int {
        self.displayOrder_DTO.value ?? -1
    }
    
    public var memAddr: String {
        self.memAddr_DTO
    }
    
    public var numAwarded: Int {
        self.numAwarded_DTO.value ?? -1
    }
    
    public var numAwardedHardcore: Int {
        self.numAwardedHardcore_DTO.value ?? -1
    }
}
 
