//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

//FIXME: this is the same struct as AchievementOfTheWeek_DTO, consider generalizing
public extension AchievementUnlocks_DTO {
    
    // MARK: - Achievement
    struct Achievement_DTO: Codable, Equatable {
        public init(id: Int, title: String, description: String, points: Int, _trueRatio: Int, author: String, _dateCreated: String, _dateModified: String) {
            self.id = id
            self.title = title
            self.description = description
            self.points = points
            self._trueRatio = _trueRatio
            self.author = author
            self._dateCreated = _dateCreated
            self._dateModified = _dateModified
        }
        
        private let id: Int
        public let title, description: String
        public let points: Int
        private let _trueRatio:Int
        public let author:String
        private let _dateCreated, _dateModified: String
        
        enum CodingKeys: String, CodingKey {
            case id = "ID"
            case title = "Title"
            case description = "Description"
            case points = "Points"
            case _trueRatio = "TrueRatio"
            case author = "Author"
            case _dateCreated = "DateCreated"
            case _dateModified = "DateModified"
        }
        
        public static func == (lhs: AchievementUnlocks_DTO.Achievement_DTO, rhs: AchievementUnlocks_DTO.Achievement_DTO) -> Bool {
            return lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.points == rhs.points &&
            lhs._trueRatio == rhs._trueRatio &&
            lhs.author == rhs.author &&
            lhs._dateCreated == rhs._dateCreated &&
            lhs._dateModified == rhs._dateModified
        }
    }
}

extension AchievementUnlocks_DTO.Achievement_DTO : Achievement, ExtendedAchievement {
    public var achievementID: Int {
        return id
    }
    
    public var achievementDescription: String {
        return description
    }
    
    public var trueRatio: Double {
        return Double(_trueRatio)
    }
    
    public var dateModified: Date {
        DateFormatter.date(fromString: self._dateModified) ?? Date.distantPast
    }
    
    public var dateCreated: Date {
        DateFormatter.date(fromString: self._dateCreated) ?? Date.distantPast
    }
    
    
}
