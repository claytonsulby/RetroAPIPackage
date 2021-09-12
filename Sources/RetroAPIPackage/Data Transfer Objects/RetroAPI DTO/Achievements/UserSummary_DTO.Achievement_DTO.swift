//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension UserSummary_DTO {
    
    // MARK: - RecentAchievement
    public struct Achievement_DTO: Codable, Equatable {
        
        public var title, gameTitle, achievementDescription:String
        
        private var _gameID, _achievementID, _points: StringMapTo<Int>
        
        public var gameID:Int {
            get { return _gameID.decoded }
            set { _gameID.decoded = newValue }
        }
        
        public var achievementID:Int {
            get { return _achievementID.decoded }
            set { _achievementID.decoded = newValue }
        }
        
        public var points:Int {
            get { return _points.decoded }
            set { _points.decoded = newValue }
        }
        
        private var badgeName:String
        private var _isAwarded, hardcoreAchieved: String
        private var _dateAwarded: String

        enum CodingKeys: String, CodingKey {
            case _achievementID = "ID"
            case _gameID = "GameID"
            case gameTitle = "GameTitle"
            case title = "Title"
            case achievementDescription = "Description"
            case _points = "Points"
            case badgeName = "BadgeName"
            case _isAwarded = "IsAwarded"
            case _dateAwarded = "DateAwarded"
            case hardcoreAchieved = "HardcoreAchieved"
        }
        
        public static func == (lhs: UserSummary_DTO.Achievement_DTO, rhs: UserSummary_DTO.Achievement_DTO) -> Bool {
            return lhs.title == rhs.title &&
                lhs.gameTitle == rhs.gameTitle &&
                lhs.achievementDescription == rhs.achievementDescription &&
                lhs.gameID == rhs.gameID &&
                lhs.achievementID == rhs.achievementID &&
                lhs.points == rhs.points &&
                lhs.badgeName == rhs.badgeName &&
                lhs.isAwarded == rhs.isAwarded &&
                lhs.hardcoreAchieved == rhs.hardcoreAchieved &&
                lhs.dateAwarded == rhs.dateAwarded
        }

    }
    
}

// MARK: - Achievement Protocol Conformance
extension UserSummary_DTO.Achievement_DTO : Achievement, AchievementImage, Awarded, AchievementRowProtocol {
    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self.badgeName + ".png")

    }
    
    public var dateAwarded: Date? {
        if isAwarded {
            return DateFormatter.standardFormat(from: self._dateAwarded)
        } else {
            return nil
        }
    }

    public var dateAwardedHardcore: Date? {

        if isAwardedHardcore {
            return DateFormatter.standardFormat(from: self._dateAwarded)
        } else {
            return nil
        }

    }
    
    public var isAwarded: Bool {
        Bool(_isAwarded) ?? false
    }
    
    public var isAwardedHardcore: Bool {
        Bool(hardcoreAchieved) ?? false
    }
    
    public var displayOrder: Int? {
        nil
    }
    
    
}


