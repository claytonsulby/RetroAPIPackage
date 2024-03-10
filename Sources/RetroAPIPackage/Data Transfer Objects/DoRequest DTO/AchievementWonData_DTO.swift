// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct AchievementWonData_DTO: Codable, DTO, Equatable {
    public init(success: Bool = false, offset: Int = 0, count: Int = 0, friendsOnly: Bool = false, achievementID: Int = 0, response: Response_DTO = Response_DTO()) {
        self.success = success
        self.offset = offset
        self.count = count
        self.friendsOnly = friendsOnly
        self.achievementID = achievementID
        self.response = response
    }
    
    public let success: Bool
    public let offset, count, achievementID: Int
    public let friendsOnly: Bool
    public let response: Response_DTO

    public enum CodingKeys: String, CodingKey {
        case success = "Success"
        case offset = "Offset"
        case count = "Count"
        case friendsOnly = "FriendsOnly"
        case achievementID = "AchievementID"
        case response = "Response"
    }
    
   public  static func == (lhs: AchievementWonData_DTO, rhs: AchievementWonData_DTO) -> Bool {
        return lhs.success == rhs.success &&
        lhs.offset == rhs.offset &&
        lhs.count == rhs.count &&
        lhs.friendsOnly == rhs.friendsOnly &&
        lhs.achievementID == rhs.achievementID &&
        lhs.response == rhs.response
    }
}

// MARK: - Response
public struct Response_DTO: Codable, DTO, Equatable {
    public init(numEarned: Int = 0, gameID: Int = 0, totalPlayers: Int = 0, recentWinner: [RecentWinner_DTO]? = nil) {
        self.numEarned = numEarned
        self.gameID = gameID
        self.totalPlayers = totalPlayers
        self.recentWinner = recentWinner
    }
    
    public let numEarned, gameID, totalPlayers: Int
    public let recentWinner: [RecentWinner_DTO]?

    public enum CodingKeys: String, CodingKey {
        case numEarned = "NumEarned"
        case gameID = "GameID"
        case totalPlayers = "TotalPlayers"
        case recentWinner = "RecentWinner"
    }
    
    public static func == (lhs: Response_DTO, rhs: Response_DTO) -> Bool {
        return lhs.numEarned == rhs.numEarned &&
        lhs.gameID == rhs.gameID &&
        lhs.totalPlayers == rhs.totalPlayers &&
        lhs.recentWinner == rhs.recentWinner
    }
}

// MARK: - RecentWinner
public struct RecentWinner_DTO: Codable, DTO, Equatable {
    public init(user: String = "", raPoints: Int = 0, dateAwarded: Int = 0) {
        self.user = user
        self.raPoints = raPoints
        self.dateAwarded = dateAwarded
    }
    
    public let user: String
    public let raPoints, dateAwarded: Int

    public enum CodingKeys: String, CodingKey {
        case user = "User"
        case raPoints = "RAPoints"
        case dateAwarded = "DateAwarded"
    }
    
    public static func == (lhs: RecentWinner_DTO, rhs: RecentWinner_DTO) -> Bool {
        return lhs.user == rhs.user &&
        lhs.raPoints == rhs.raPoints &&
        lhs.dateAwarded == rhs.dateAwarded
    }
}
