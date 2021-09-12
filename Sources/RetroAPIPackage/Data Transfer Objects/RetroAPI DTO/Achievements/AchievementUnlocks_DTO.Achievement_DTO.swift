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
    public struct Achievement_DTO: Codable, Equatable {
        private var _achievementID, _points: StringMapTo<Int>
        private var _trueRatio: StringMapTo<Double>
        private var _dateCreated, _dateModified: String
        
        public var achievementID:Int {
            get { return _achievementID.decoded }
            set { _achievementID.decoded = newValue }
        }

        public var points:Int {
            get { return _points.decoded }
            set { _points.decoded = newValue }
        }

        public var trueRatio:Double {
            get { return _trueRatio.decoded }
            set { _trueRatio.decoded = newValue }
        }
        
        public var dateModified: Date {
            get { return DateFormatter.standardFormat(from: self._dateModified) ?? Date(timeIntervalSince1970: 0) }
            set { _dateModified = newValue.string }
        }

        public var dateCreated: Date {
            get { return DateFormatter.standardFormat(from: self._dateCreated) ?? Date(timeIntervalSince1970: 0) }
            set { _dateCreated = newValue.string }
        }
        
        public var title, achievementDescription: String
        public var author: String

        
        enum CodingKeys: String, CodingKey {
            case _achievementID = "ID"
            case title = "Title"
            case achievementDescription = "Description"
            case _points = "Points"
            case _trueRatio = "TrueRatio"
            case author = "Author"
            case _dateCreated = "DateCreated"
            case _dateModified = "DateModified"
        }
        
        public static func == (lhs: AchievementUnlocks_DTO.Achievement_DTO, rhs: AchievementUnlocks_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
                lhs.points == rhs.points &&
                lhs.trueRatio == rhs.trueRatio &&
                lhs.dateCreated == rhs.dateCreated &&
                lhs.dateModified == rhs.dateModified &&
                lhs.title == rhs.title &&
                lhs.achievementDescription == rhs.achievementDescription &&
                lhs.author == rhs.author
        }
    }
}

extension AchievementUnlocks_DTO.Achievement_DTO : Achievement, ExtendedAchievement {
    
}
