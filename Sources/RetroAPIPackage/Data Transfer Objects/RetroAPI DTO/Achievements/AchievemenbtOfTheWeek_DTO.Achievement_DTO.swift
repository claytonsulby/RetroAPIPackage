//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension AchievementOfTheWeek_DTO {
    // MARK: - Achievement
    struct Achievement_DTO: Codable, Equatable {
        
        public init(achievementID:Int = 0, points: Int = 0, _trueRatio:Int = 0, _dateCreated: String = "", _dateModified: String = "", title: String = "", achievementDescription: String = "", author: String = "") {
            self.achievementID = achievementID
            self.points = points
            self._trueRatio = _trueRatio
            self._dateCreated = _dateCreated
            self._dateModified = _dateModified
            self.title = title
            self.achievementDescription = achievementDescription
            self.author = author
        }
        
        public var achievementID, points: Int
        private var _trueRatio:Int
        private var _dateCreated, _dateModified: String

        public var trueRatio:Double {
            get { return Double(_trueRatio) }
            set { _trueRatio = Int(newValue) }
        }
        
        public var dateModified: Date {
            get { return DateFormatter.date(fromString: self._dateModified) ?? Date(timeIntervalSince1970: 0) }
            set { _dateModified = newValue.string }
        }

        public var dateCreated: Date {
            get { return DateFormatter.date(fromString: self._dateCreated) ?? Date(timeIntervalSince1970: 0) }
            set { _dateCreated = newValue.string }
        }
        
        public var title, achievementDescription: String
        public var author: String

        
        enum CodingKeys: String, CodingKey {
            case achievementID = "ID"
            case title = "Title"
            case achievementDescription = "Description"
            case points = "Points"
            case _trueRatio = "TrueRatio"
            case author = "Author"
            case _dateCreated = "DateCreated"
            case _dateModified = "DateModified"
        }
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Achievement_DTO, rhs: AchievementOfTheWeek_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
            lhs.points == rhs.points &&
            lhs._trueRatio == rhs._trueRatio &&
            lhs._dateCreated == rhs._dateCreated &&
            lhs._dateModified == rhs._dateModified &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
            lhs.author == rhs.author
        }
        
    }
}

extension AchievementOfTheWeek_DTO.Achievement_DTO : Achievement, ExtendedAchievement, AchievementRowProtocol {
    
    public var displayOrder: Int? {
        nil
    }
    
    public var imageURL: URL? {
        nil
    }
    
    public var dateAwarded: Date? {
        nil
    }
    
    public var dateAwardedHardcore: Date? {
        nil
    }
    
    public var isAwarded: Bool {
        false
    }
    
    public var isAwardedHardcore: Bool {
        false
    }
    
}
