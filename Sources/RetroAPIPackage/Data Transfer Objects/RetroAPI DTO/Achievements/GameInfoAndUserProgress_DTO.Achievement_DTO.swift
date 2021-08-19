//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension GameInfoAndUserProgress_DTO {
    
    public struct Achievement_DTO: Codable, Equatable {

        private var achievementID_DTO, numAwarded_DTO, numAwardedHardcore_DTO, points_DTO, trueRatio_DTO, displayOrder_DTO: PHPHelper.PHPInt
        private var title_DTO: String
        private var achievementDescription_DTO: String
        private var author_DTO: String
        private var dateModified_DTO, dateCreated_DTO, badgeName_DTO: String
        private var memAddr_DTO, dateEarned_DTO, dateEarnedHardcore_DTO: String

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
            case dateEarned_DTO = "DateEarned"
            case dateEarnedHardcore_DTO = "DateEarnedHardcore"
        }
        
        public static func == (lhs: GameInfoAndUserProgress_DTO.Achievement_DTO, rhs: GameInfoAndUserProgress_DTO.Achievement_DTO) -> Bool {
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
                lhs.memAddr_DTO == rhs.memAddr_DTO &&
                lhs.dateEarned_DTO == rhs.dateEarned_DTO &&
                lhs.dateEarnedHardcore_DTO == rhs.dateEarnedHardcore_DTO
        }

    }
    
}

extension GameInfoAndUserProgress_DTO.Achievement_DTO : ImagedAwardedExtendedAchievementFromSet {
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
    
    public var dateAwarded: Date? {
        
        DateFormatter.standardFormat(from: self.dateEarned_DTO)

    }
    
    public var dateAwardedHardcore: Date? {
        
        DateFormatter.standardFormat(from: self.dateEarnedHardcore_DTO)
        
    }
    
    public var isAwarded: Bool {
        
        self.dateAwarded != nil
        
    }
    
    public var isAwardedHardcore: Bool {
        
        self.dateAwardedHardcore != nil
        
    }
    
    
}
