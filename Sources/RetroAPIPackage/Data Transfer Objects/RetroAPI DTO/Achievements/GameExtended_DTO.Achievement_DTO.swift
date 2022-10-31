//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

//FIXME: this is the same as gameinfoanduserprogress achievement, but only missing dateEarned/dateEarnedHardcore
public extension GameExtended_DTO {
    
    //TODO: quick help comments
    struct Achievement_DTO: Codable, Equatable {
        
        private var _achievementID: StringMapTo<Int>
        private var _numAwarded:  StringMapTo<Int>
        private var _numAwardedHardcore:  StringMapTo<Int>
        private var _displayOrder:  StringMapTo<Int>
        private var _points:  StringMapTo<Int>
        private var _trueRatio:  StringMapTo<Double>
        
        //Public get/set computed properties for wrapped variables
        public var achievementID:Int {
            get { return _achievementID.decoded }
            set { _achievementID.decoded = newValue }
        }
        
        public var numAwarded:Int {
            get { return _numAwarded.decoded }
            set { _numAwarded.decoded = newValue }
        }
        
        public var numAwardedHardcore:Int {
            get { return _numAwardedHardcore.decoded }
            set { _numAwardedHardcore.decoded = newValue }
        }
        
        public var points:Int {
            get { return _points.decoded }
            set { _points.decoded = newValue }
        }
        
        public var displayOrder:Int? {
            get { return _displayOrder.decoded }
            set { _displayOrder.decoded = newValue ?? -1 }
        }
        
        public var trueRatio:Double {
            get { return _trueRatio.decoded }
            set { _trueRatio.decoded = newValue }
        }
        
        public var title: String
        public var achievementDescription: String
        public var author: String
        public var memAddr: String
        
        private var _dateModified: String
        private var _dateCreated: String
        private var badgeName: String

        enum CodingKeys: String, CodingKey {
            case _achievementID = "ID"
            case _numAwarded = "NumAwarded"
            case _numAwardedHardcore = "NumAwardedHardcore"
            case title = "Title"
            case achievementDescription = "Description"
            case _points = "Points"
            case _trueRatio = "TrueRatio"
            case author = "Author"
            case _dateModified = "DateModified"
            case _dateCreated = "DateCreated"
            case badgeName = "BadgeName"
            case _displayOrder = "DisplayOrder"
            case memAddr = "MemAddr"
        }
        
        public static func == (lhs: GameExtended_DTO.Achievement_DTO, rhs: GameExtended_DTO.Achievement_DTO) -> Bool {
            return lhs._achievementID == rhs._achievementID &&
            lhs._numAwarded == rhs._numAwarded &&
            lhs._numAwardedHardcore == rhs._numAwardedHardcore &&
            lhs._displayOrder == rhs._displayOrder &&
            lhs._points == rhs._points &&
            lhs._trueRatio == rhs._trueRatio &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
            lhs.author == rhs.author &&
            lhs.memAddr == rhs.memAddr &&
            lhs._dateModified == rhs._dateModified &&
            lhs._dateCreated == rhs._dateCreated &&
            lhs.badgeName == rhs.badgeName
        }

    }
}

extension GameExtended_DTO.Achievement_DTO : Achievement, ExtendedAchievement, AchievementImage, AchievementRowProtocol {
    
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

    public var dateModified: Date {

        return DateFormatter.date(fromString: self._dateModified) ?? Date(timeIntervalSince1970: 0)

    }

    public var dateCreated: Date {

        return DateFormatter.date(fromString: self._dateCreated) ?? Date(timeIntervalSince1970: 0)

    }

    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self.badgeName + ".png")

    }
    
}
 
