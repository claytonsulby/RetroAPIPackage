// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - UserProgressElement_DTO
public struct UserProgressElement_DTO: Codable, Equatable {
    public init(numPossibleAchievements: PHPHelper.JSONPrimitiveType? = nil, possibleScore: PHPHelper.JSONPrimitiveType? = nil, numAchieved: PHPHelper.JSONPrimitiveType? = nil, scoreAchieved: PHPHelper.JSONPrimitiveType? = nil, numAchievedHardcore: PHPHelper.JSONPrimitiveType? = nil, scoreAchievedHardcore: PHPHelper.JSONPrimitiveType? = nil) {
        self.numPossibleAchievements = numPossibleAchievements
        self.possibleScore = possibleScore
        self.numAchieved = numAchieved
        self.scoreAchieved = scoreAchieved
        self.numAchievedHardcore = numAchievedHardcore
        self.scoreAchievedHardcore = scoreAchievedHardcore
    }
    
    public var numPossibleAchievements, possibleScore, numAchieved, scoreAchieved: PHPHelper.JSONPrimitiveType?
    public var numAchievedHardcore, scoreAchievedHardcore: PHPHelper.JSONPrimitiveType?

    enum CodingKeys: String, CodingKey {
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
        case numAchievedHardcore = "NumAchievedHardcore"
        case scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
    
    public static func == (lhs: UserProgressElement_DTO, rhs: UserProgressElement_DTO) -> Bool {
        return lhs.numPossibleAchievements == rhs.numPossibleAchievements &&
            lhs.possibleScore == rhs.possibleScore &&
            lhs.numAchieved == rhs.numAchieved &&
            lhs.scoreAchieved == rhs.scoreAchieved &&
            lhs.numAchievedHardcore == rhs.numAchievedHardcore &&
            lhs.scoreAchievedHardcore == rhs.scoreAchievedHardcore
    }
}

public typealias UserProgress_DTO = [String: UserProgressElement_DTO]
