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

extension UserRecent_DTO: Game, Console, GameImage, RecentlyPlayed, GameProgress {
    public var gameID: Int? {
        self.gameID_DTO!.value!
    }
    
    public var title: String {
        self.title_DTO!
    }
    
    public var consoleID: Int? {
        self.consoleID_DTO!.value!
    }
    
    public var consoleName: String {
        self.consoleName_DTO!
    }
    
    public var imageIconURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageIcon_DTO!)!
    }
    
    public var lastPlayed: Date {
        return DateFormatter.standardFormat(from: self.lastPlayed_DTO!)!
    }
    
    public var userSubmittedRating: Int? {
        if let myVote = self.myVote_DTO {
            return myVote.value!
        } else {
            return nil
        }
    }
    
    public var userCompletionPercentage: Double? {
        Double(self.numAwardedAchievements) / Double(self.numPossibleAchievements!)
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
        (self.numAchieved_DTO?.value!)!
    }
    
    public var numPossibleAchievements: Int? {
        self.numPossibleAchievements_DTO?.value!
    }
    
    public var hardcoreModeEnabled: Bool? {
        nil
    }
    
    
}
