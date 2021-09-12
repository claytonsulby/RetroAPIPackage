//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension GameInfoAndUserProgress_DTO {
    
    public struct Achievement_DTO: Codable, Equatable {

        //Private StringCodableMap wrapped variables
        private var _achievementID, _numAwarded, _numAwardedHardcore, _points, _displayOrder: StringMapTo<Int>
        private var _trueRatio: StringMapTo<Double>
        
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
        
        //Private variables replaced by computed properties for ease of use /s type conversion
        private var _dateModified, _dateCreated, badgeName: String
        private var _dateEarned, _dateEarnedHardcore: String?
        
        public var title: String
        public var achievementDescription: String
        public var author: String
        public var memAddr: String
        

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
            case _dateEarned = "DateEarned"
            case _dateEarnedHardcore = "DateEarnedHardcore"
        }
        
        // NOTE: equitable conformance depends on public computed properties
        public static func == (lhs: GameInfoAndUserProgress_DTO.Achievement_DTO, rhs: GameInfoAndUserProgress_DTO.Achievement_DTO) -> Bool {
            return
                lhs.achievementID == rhs.achievementID &&
                lhs.numAwarded == rhs.numAwarded &&
                lhs.numAwardedHardcore == rhs.numAwardedHardcore &&
                lhs.points == rhs.points &&
                lhs.displayOrder == rhs.displayOrder &&
                lhs.trueRatio == rhs.trueRatio &&
                lhs.title == rhs.title &&
                lhs.achievementDescription == rhs.achievementDescription &&
                lhs.author == rhs.author &&
                lhs.dateModified == rhs.dateModified &&
                lhs.dateCreated == rhs.dateCreated &&
                lhs.badgeName == rhs.badgeName &&
                lhs.dateAwarded == rhs.dateAwarded &&
                lhs.dateAwardedHardcore == rhs.dateAwardedHardcore &&
                lhs.memAddr == rhs.memAddr
        }

    }
    
}


extension GameInfoAndUserProgress_DTO.Achievement_DTO : Achievement, ExtendedAchievement, AchievementImage, Awarded, ExtendedAchievementRowProtocol {

    public var dateModified: Date {

        return DateFormatter.standardFormat(from: self._dateModified) ?? Date(timeIntervalSince1970: 0)

    }

    public var dateCreated: Date {

        return DateFormatter.standardFormat(from: self._dateCreated) ?? Date(timeIntervalSince1970: 0)

    }

    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self.badgeName + ".png")

    }
    
    public var dateAwarded: Date? {

        DateFormatter.standardFormat(from: self._dateEarned ?? "")

    }

    public var dateAwardedHardcore: Date? {

        DateFormatter.standardFormat(from: self._dateEarnedHardcore ?? "")

    }

    public var isAwarded: Bool {

        self.dateAwarded != nil

    }

    public var isAwardedHardcore: Bool {

        self.dateAwardedHardcore != nil

    }
    
}
