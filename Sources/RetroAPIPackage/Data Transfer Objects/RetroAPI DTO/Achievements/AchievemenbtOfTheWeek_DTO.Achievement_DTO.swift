//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {
    // MARK: - Achievement
    public struct Achievement_DTO: Codable, Equatable {
        private var achievementID_DTO, points_DTO, trueRatio_DTO: PHPHelper.PHPInt
        private var title_DTO, achievementDescription_DTO: String
        private var author_DTO, dateCreated_DTO, dateModified_DTO: String
        
        enum CodingKeys: String, CodingKey {
            case achievementID_DTO = "ID"
            case title_DTO = "Title"
            case achievementDescription_DTO = "Description"
            case points_DTO = "Points"
            case trueRatio_DTO = "TrueRatio"
            case author_DTO = "Author"
            case dateCreated_DTO = "DateCreated"
            case dateModified_DTO = "DateModified"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Achievement_DTO, rhs: AchievementOfTheWeek_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID_DTO == rhs.achievementID_DTO &&
                lhs.title_DTO == rhs.title_DTO &&
                lhs.achievementDescription_DTO == rhs.achievementDescription_DTO &&
                lhs.points_DTO == rhs.points_DTO &&
                lhs.trueRatio_DTO == rhs.trueRatio_DTO &&
                lhs.author_DTO == rhs.author_DTO &&
                lhs.dateCreated_DTO == rhs.dateCreated_DTO &&
                lhs.dateModified_DTO == rhs.dateModified_DTO
        }
    }
}

extension AchievementOfTheWeek_DTO.Achievement_DTO : Achievement, ExtendedAchievement {
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
    
    public var trueRatio: Double {
//        self.trueRatio_DTO.value ?? -1.0
        -1.0
    }
    
    public var author: String {
        self.author_DTO
    }
    
    public var dateModified: Date {
        
        DateFormatter.standardFormat(from: self.dateModified_DTO) ?? Date(timeIntervalSince1970: 0)
        
    }
    
    public var dateCreated: Date {
        DateFormatter.standardFormat(from: self.dateCreated_DTO) ?? Date(timeIntervalSince1970: 0)
    }
    
    
}
