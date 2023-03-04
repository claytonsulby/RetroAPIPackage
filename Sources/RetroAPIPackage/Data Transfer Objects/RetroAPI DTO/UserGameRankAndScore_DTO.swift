// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
public struct UserGameRankAndScoreElement_DTO: Codable, Equatable {
    public init(user: String? = nil, _totalScore: PHPHelper.PHPInt? = nil, lastAward: String? = nil, _userRank: PHPHelper.PHPInt? = nil) {
        self.user = user
        self._totalScore = _totalScore
        self.lastAward = lastAward
        self._userRank = _userRank
    }
    
    public var user, lastAward: String?
    private var _totalScore, _userRank: PHPHelper.PHPInt?
    
    public var totalScore: Int? {
        get { _totalScore?.decoded }
    }
    
    public var userRank: Int? {
        get { _userRank?.decoded }
    }

    enum CodingKeys: String, CodingKey {
        case user = "User"
        case _totalScore = "TotalScore"
        case lastAward = "LastAward"
        case _userRank = "UserRank"
    }
    
    public static func == (lhs: UserGameRankAndScoreElement_DTO, rhs: UserGameRankAndScoreElement_DTO) -> Bool {
        return lhs.user == rhs.user &&
            lhs.totalScore == rhs.totalScore &&
            lhs.lastAward == rhs.lastAward &&
            lhs.userRank == rhs.userRank
    }
}

public typealias UserGameRankAndScore_DTO = [UserGameRankAndScoreElement_DTO]
