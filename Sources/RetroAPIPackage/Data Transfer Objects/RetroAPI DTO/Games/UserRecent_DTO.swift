// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserRecent_DTO: Codable {

    private var consoleName_DTO, title_DTO: String?
    private var imageIcon_DTO, lastPlayed_DTO: String?
    private var gameID_DTO, consoleID_DTO, myVote_DTO: PHPHelper.PHPInt?
    private var numPossibleAchievements_DTO, possibleScore_DTO, numAchieved_DTO, scoreAchieved_DTO: PHPHelper.PHPInt?

    enum CodingKeys: String, CodingKey {
        case gameID_DTO = "GameID"
        case consoleID_DTO = "ConsoleID"
        case consoleName_DTO = "ConsoleName"
        case title_DTO = "Title"
        case imageIcon_DTO = "ImageIcon"
        case lastPlayed_DTO = "LastPlayed"
        case myVote_DTO = "MyVote"
        case numPossibleAchievements_DTO = "NumPossibleAchievements"
        case possibleScore_DTO = "PossibleScore"
        case numAchieved_DTO = "NumAchieved"
        case scoreAchieved_DTO = "ScoreAchieved"
    }
    
}

public typealias UserRecents_DTO = [UserRecent_DTO]

extension UserRecent_DTO: Game, Console, GameIcon, RecentlyPlayed, GameProgress {
    public var gameID: Int? {
        self.gameID_DTO?.value ?? -1
    }
    
    public var title: String {
        self.title_DTO ?? ""
    }
    
    public var consoleID: Int? {
        self.consoleID_DTO?.value ?? -1
    }
    
    public var consoleName: String {
        self.consoleName_DTO ?? ""
    }
    
    public var imageIconURL: URL? {
        
        if let imageIconURL = self.imageIcon_DTO {
            return URL(string: RetroAPI.baseImageURL + imageIconURL)
        } else {
            return nil
        }
    }
    
    public var lastPlayed: Date {
        
        if let lastPlayed = self.lastPlayed_DTO {
            return DateFormatter.standardFormat(from: lastPlayed) ?? Date(timeIntervalSince1970: 0)
        } else {
            return Date(timeIntervalSince1970: 0)
        }

    }
    
    public var userSubmittedRating: Int? {
        if let myVote = self.myVote_DTO {
            return myVote.value ?? -1
        } else {
            return nil
        }
    }
    
    public var userCompletionPercentage: Double? {
        
        if let numPossibleAchievements = self.numPossibleAchievements {
            if numPossibleAchievements > 0 {
                return Double(self.numAwardedAchievements) / Double(numPossibleAchievements)
            } else {
                return 0
            }
        } else {
            return nil
        }
    }
    
    public var userCompletionHardcorePercentage: Double? {
        nil
    }
    
    public var possibleScore: Int? {
        nil
    }
    
    public var awardedScore: Int? {
        nil
    }
    
    public var numAwardedAchievements: Int {
        self.numAchieved_DTO?.value ?? -1
    }
    
    public var numPossibleAchievements: Int? {
        self.numPossibleAchievements_DTO?.value ?? -1
    }
    
    public var hardcoreModeEnabled: Bool? {
        nil
    }
    
    
}
