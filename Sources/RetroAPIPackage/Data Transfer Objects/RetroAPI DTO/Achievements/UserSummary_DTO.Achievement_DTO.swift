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

        public var achievementID, gameID: Int
        public var gameTitle, title, achievementDescription: String
        public let points: Int
        public let type: String?
        private let _badgeName: String
        private let _isAwarded:String
        private let _dateAwarded: String?
        private let _hardcoreAchieved: Int?

        enum CodingKeys: String, CodingKey {
            case achievementID = "ID"
            case gameID = "GameID"
            case gameTitle = "GameTitle"
            case title = "Title"
            case achievementDescription = "Description"
            case points = "Points"
            case type = "Type"
            case _badgeName = "BadgeName"
            case _isAwarded = "IsAwarded"
            case _dateAwarded = "DateAwarded"
            case _hardcoreAchieved = "HardcoreAchieved"
        }
        
    }
    
}

extension UserSummary_DTO.Achievement_DTO : Identifiable, Hashable {
    public var id: ObjectIdentifier {
        ObjectIdentifier(Self.self)
    }
}

// MARK: - Achievement Protocol Conformance
extension UserSummary_DTO.Achievement_DTO : Achievement, AchievementImage, Awarded, AchievementRowProtocol {

    public var imageURL: URL? {

        URL(string: RetroAPI.baseBadgeURL + self._badgeName + ".png")

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
            if _hardcoreAchieved == 0 {
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
