// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - UserProgressElement_DTO
public struct UserProgressElement_DTO: Codable, Equatable {
    public let numPossibleAchievements, possibleScore, numAchieved, scoreAchieved: Int
    public let numAchievedHardcore, scoreAchievedHardcore: Int

    enum CodingKeys: String, CodingKey {
        case numPossibleAchievements = "NumPossibleAchievements"
        case possibleScore = "PossibleScore"
        case numAchieved = "NumAchieved"
        case scoreAchieved = "ScoreAchieved"
        case numAchievedHardcore = "NumAchievedHardcore"
        case scoreAchievedHardcore = "ScoreAchievedHardcore"
    }
}

public typealias UserProgress_DTO = [String: UserProgressElement_DTO]
