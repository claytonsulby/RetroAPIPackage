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
        
        public init(_achievementID: StringMapTo<Int> = StringMapTo(0), _points: StringMapTo<Int> = StringMapTo(0), _trueRatio: StringMapTo<Double> = StringMapTo(0), _dateCreated: String = "", _dateModified: String = "", title: String = "", achievementDescription: String = "", author: String = "") {
            self._achievementID = _achievementID
            self._points = _points
            self._trueRatio = _trueRatio
            self._dateCreated = _dateCreated
            self._dateModified = _dateModified
            self.title = title
            self.achievementDescription = achievementDescription
            self.author = author
        }
        
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
        
        public static func == (lhs: AchievementOfTheWeek_DTO.Achievement_DTO, rhs: AchievementOfTheWeek_DTO.Achievement_DTO) -> Bool {
            return lhs._achievementID == rhs._achievementID &&
            lhs._points == rhs._points &&
            lhs._trueRatio == rhs._trueRatio &&
            lhs._dateCreated == rhs._dateCreated &&
            lhs._dateModified == rhs._dateModified &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
            lhs.author == rhs.author
        }
        
    }
}

extension AchievementOfTheWeek_DTO.Achievement_DTO : Achievement, ExtendedAchievement {
    
}
