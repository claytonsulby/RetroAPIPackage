// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserCompletedGame_DTO: Codable {
    
    private var gameID_DTO, numAwarded_DTO, maxPossible_DTO: PHPHelper.PHPInt?
    private var consoleName_DTO, imageIcon_DTO, title_DTO: String?
    private var pctWon_DTO, hardcoreMode_DTO: String?

    enum CodingKeys: String, CodingKey {
        case gameID_DTO = "GameID"
        case consoleName_DTO = "ConsoleName"
        case imageIcon_DTO = "ImageIcon"
        case title_DTO = "Title"
        case numAwarded_DTO = "NumAwarded"
        case maxPossible_DTO = "MaxPossible"
        case pctWon_DTO = "PctWon"
        case hardcoreMode_DTO = "HardcoreMode"
    }

}

public typealias UserCompletedGames_DTO = [UserCompletedGame_DTO]

extension UserCompletedGame_DTO: Game, GameImage, Console, GameProgress {
    public var gameID: Int? {
        self.gameID_DTO!.value!
    }
    
    public var title: String {
        self.title_DTO!
    }
    
    public var imageIconURL: URL {
        URL(string: RetroAPI.baseImageURL + self.imageIcon_DTO!)!
    }
    
    public var consoleID: Int? {
        nil
    }
    
    public var consoleName: String {
        self.consoleName_DTO!
    }
    
    public var userCompletionPercentage: Double? {
        if hardcoreModeEnabled! {
            return nil
        } else {
            return Double(self.pctWon_DTO!)!
        }
    }
    
    public var userCompletionHardcorePercentage: Double? {
        if hardcoreModeEnabled! {
            return Double(self.pctWon_DTO!)!
        } else {
            return nil
        }
    }
    
    public var possibleScore: Int? {
        nil
    }
    
    public var awardedScore: Int? {
        nil
    }
    
    public var numAwardedAchievements: Int {
        self.numAwarded_DTO!.value!
    }
    
    public var numPossibleAchievements: Int? {
        if hardcoreModeEnabled! {
            return Int((Double(numAwardedAchievements) * userCompletionHardcorePercentage!).rounded(.up))
        } else {
            return Int((Double(numAwardedAchievements) * userCompletionPercentage!).rounded(.up))
        }
    }
    
    public var hardcoreModeEnabled: Bool? {
        Bool(exactly: Int(self.hardcoreMode_DTO!)! as NSNumber)!
    }
    
    
}
