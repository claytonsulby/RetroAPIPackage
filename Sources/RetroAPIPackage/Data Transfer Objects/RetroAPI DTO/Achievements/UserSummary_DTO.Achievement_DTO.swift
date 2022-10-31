//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension UserSummary_DTO {
    
    // MARK: - RecentAchievement
    struct Achievement_DTO: Codable, Equatable {
        
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
        private var _isAwarded: String
        private var _hardcoreAchieved: String?
        private var _dateAwarded: String?

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
            case _hardcoreAchieved = "HardcoreAchieved"
        }
        
        public static func == (lhs: UserSummary_DTO.Achievement_DTO, rhs: UserSummary_DTO.Achievement_DTO) -> Bool {
            return lhs.title == rhs.title &&
                lhs.gameTitle == rhs.gameTitle &&
                lhs.achievementDescription == rhs.achievementDescription &&
                lhs._gameID == rhs._gameID &&
                lhs._achievementID == rhs._achievementID &&
                lhs._points == rhs._points &&
                lhs.badgeName == rhs.badgeName &&
                lhs._isAwarded == rhs._isAwarded &&
                lhs._hardcoreAchieved == rhs._hardcoreAchieved &&
                lhs._dateAwarded == rhs._dateAwarded
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
            return DateFormatter.date(fromString: _dateAwarded ?? "")
//            format(from: self._dateAwarded ?? "")
        } else {
            return nil
        }
    }

    public var dateAwardedHardcore: Date? {

        if isAwardedHardcore {
            return DateFormatter.date(fromString: _dateAwarded ?? "")
        } else {
            return nil
        }

    }
    
    public var isAwarded: Bool {
        if _isAwarded == "0" {
            return false
        } else {
            return true
        }
    }
    
    public var isAwardedHardcore: Bool {
        if let _hardcoreAchieved = _hardcoreAchieved {
            if _hardcoreAchieved == "0" {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    public var displayOrder: Int? {
        nil
    }
    
    
}

extension UserSummary_DTO.Achievement_DTO : Hashable, Identifiable {
    public var id: Int {
        self.achievementID
    }
    
    
}

