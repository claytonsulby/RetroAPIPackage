//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension GameInfoAndUserProgress_DTO {
    
    struct Achievement_DTO: Codable, Equatable {

        //Private StringCodableMap wrapped variables
        public var achievementID, numAwarded, numAwardedHardcore, points:Int
        public var displayOrder:Int?
        public var trueRatio:Double
        
        //Private variables replaced by computed properties for ease of use /s type conversion
        private var _dateModified, _dateCreated, badgeName: String
        private var _dateEarned, _dateEarnedHardcore: String?
        
        public var title: String
        public var achievementDescription: String
        public var author: String
        public var memAddr: String
        

        enum CodingKeys: String, CodingKey {
            case achievementID = "ID"
            case numAwarded = "NumAwarded"
            case numAwardedHardcore = "NumAwardedHardcore"
            case title = "Title"
            case achievementDescription = "Description"
            case points = "Points"
            case trueRatio = "TrueRatio"
            case author = "Author"
            case _dateModified = "DateModified"
            case _dateCreated = "DateCreated"
            case badgeName = "BadgeName"
            case displayOrder = "DisplayOrder"
            case memAddr = "MemAddr"
            case _dateEarned = "DateEarned"
            case _dateEarnedHardcore = "DateEarnedHardcore"
        }
        
        public static func == (lhs: GameInfoAndUserProgress_DTO.Achievement_DTO, rhs: GameInfoAndUserProgress_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
            lhs.numAwarded == rhs.numAwarded &&
            lhs.numAwardedHardcore == rhs.numAwardedHardcore &&
            lhs.points == rhs.points &&
            lhs.displayOrder == rhs.displayOrder &&
            lhs.trueRatio == rhs.trueRatio &&
            lhs._dateModified == rhs._dateModified &&
            lhs._dateCreated == rhs._dateCreated &&
            lhs.badgeName == rhs.badgeName &&
            lhs._dateEarned == rhs._dateEarned &&
            lhs._dateEarnedHardcore == rhs._dateEarnedHardcore &&
            lhs.title == rhs.title &&
            lhs.achievementDescription == rhs.achievementDescription &&
            lhs.author == rhs.author &&
            lhs.memAddr == rhs.memAddr
        }

    }
    
}


extension GameInfoAndUserProgress_DTO.Achievement_DTO : Achievement, ExtendedAchievement, AchievementImage, Awarded, ExtendedAchievementRowProtocol {

    public var dateModified: Date {

        return DateFormatter.date(fromString: self._dateModified) ?? Date(timeIntervalSince1970: 0)

    }

    public var dateCreated: Date {

        return DateFormatter.date(fromString: self._dateCreated) ?? Date(timeIntervalSince1970: 0)

    }

    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self.badgeName + ".png")

    }
    
    public var dateAwarded: Date? {

        DateFormatter.date(fromString: self._dateEarned ?? "")

    }

    public var dateAwardedHardcore: Date? {

        DateFormatter.date(fromString: self._dateEarnedHardcore ?? "")

    }

    public var isAwarded: Bool {

        self.dateAwarded != nil

    }

    public var isAwardedHardcore: Bool {

        self.dateAwardedHardcore != nil

    }
    
}
