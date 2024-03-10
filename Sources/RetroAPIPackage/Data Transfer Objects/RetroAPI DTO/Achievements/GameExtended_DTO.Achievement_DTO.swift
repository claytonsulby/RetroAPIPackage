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
        
        public var achievementID:Int
        public var numAwarded:Int
        public var numAwardedHardcore:Int
        public var displayOrder:Int?
        public var points:Int
        public var trueRatio:Double

        public var title: String
        public var achievementDescription: String
        public var author: String
        public var memAddr: String
        
        private var _dateModified: String
        private var _dateCreated: String
        private var badgeName: String

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
        }
        
        public static func == (lhs: GameExtended_DTO.Achievement_DTO, rhs: GameExtended_DTO.Achievement_DTO) -> Bool {
            return lhs.achievementID == rhs.achievementID &&
            lhs.numAwarded == rhs.numAwarded &&
            lhs.numAwardedHardcore == rhs.numAwardedHardcore &&
            lhs.displayOrder == rhs.displayOrder &&
            lhs.points == rhs.points &&
            lhs.trueRatio == rhs.trueRatio &&
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
 
