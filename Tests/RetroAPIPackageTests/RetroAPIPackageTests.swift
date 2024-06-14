import XCTest
import Combine
@testable import RetroAPIPackage

extension XCTestCase {
    func awaitPublisher<T: Publisher>(
        _ publisher: T,
        timeout: TimeInterval = 100,
        file: StaticString = #file,
        line: UInt = #line
    ) throws -> T.Output {
        // This time, we use Swift's Result type to keep track
        // of the result of our Combine pipeline:
        var result: Result<T.Output, Error>?
        let expectation = self.expectation(description: "Awaiting publisher")
        
        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }
                
                expectation.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )
        
        // Just like before, we await the expectation that we
        // created at the top of our test, and once done, we
        // also cancel our cancellable to avoid getting any
        // unused variable warnings:
        waitForExpectations(timeout: timeout)
        cancellable.cancel()
        
        // Here we pass the original file and line number that
        // our utility was called at, to tell XCTest to report
        // any encountered errors at that original call site:
        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )
        
        return try unwrappedResult.get()
    }
}

final class Cases {
    
    fileprivate static let games = [
        "Official Game":10003,
        "Hub":3090,
        "Hack":10781,
        "Has Null Flag":3,
        "~Z~":20140
    ]
    fileprivate static let consoles = [
        "0":0,
        "1":1,
        "2":2,
        "3":3,
        "4":4,
        "5":5,
        "6":6,
        "7":7,
        "8":8,
        "9":9,
        "10":10,
        "11":11,
        "12":12,
        "13":13,
        "14":14,
        "15":15,
        "16":16,
        "17":17,
        "18":18,
        "19":19,
        "20":20,
        "21":21,
        "22":22,
        "23":23,
        "24":24,
        "25":25,
        "26":26,
        "27":27,
        "28":28,
        "29":29,
        "30":30,
        "31":31,
        "32":32,
        "33":33,
        "34":34,
        "35":35,
        "36":36,
        "37":37,
        "38":38,
        "39":39,
        "40":40,
        "41":41,
        "42":42,
        "43":43,
        "44":44,
        "45":45,
        "46":46,
        "47":47,
        "48":48,
        "49":49,
        "50":50
    ]
    fileprivate static let users = [
        "Me":"wertox123",
        "Veteran":"maxmilyin",
        "New Player":"blackspot31",
//        "Deleted Player":"blazekickn", //Should handle as user does not exist error instead of try to decode nil
        "Scott":"Scott"
    ]
    fileprivate static let achievements = [
        "a":48638
    ]
    fileprivate static let tickets = [
        "a":1
    ]
}

final class RetroAPITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        RetroAPI.setUserAndKey("wertox123", "NntdFEl8LSxcqcEaud8AN33uRrgAsEBU")
    }
    
    static var allTests = [
        ("testGetTopUsers", RetroAPITests_AsyncAwait.testGetTopUsers),
    ]
    
}

fileprivate extension Sequence {
    func asyncForEach(
        _ operation: (Element) async throws -> Void
    ) async rethrows {
        for element in self {
            try await operation(element)
        }
    }
}

final class RetroAPITests_AsyncAwait : XCTestCase {
    
    override func setUp() {
        super.setUp()
        RetroAPI.setUserAndKey("wertox123", "NntdFEl8LSxcqcEaud8AN33uRrgAsEBU")
    }
    
    static var allTests = [
        ("testGetTopUsers", testGetTopUsers),
    ]
    
    func testGetTopUsers() async throws {
        let result = try await RetroAPI.getTopTenUsers()
        XCTAssertNotEqual(result, TopUsers_DTO())
    }
    
    func testGetGame() async throws {
        try await Cases.games.asyncForEach({ (key: String, value: Int) in
            let result = try await RetroAPI.getGame(gameID: value)
            XCTAssertNotEqual(result, Game_DTO())
        })
    }
    
    func testGetGameExtended() async throws {
        try await Cases.games.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getGameExtended(gameID: value)
            XCTAssertNotEqual(result, GameExtended_DTO())
        }
    }
    
    func testGetConsoleIDs() async throws {
        let result = try await RetroAPI.getConsoleIDs()
        XCTAssertNotEqual(result, Consoles_DTO())
    }
    
    func testGetGameList() async throws {
        try await Cases.consoles.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getGameList(consoleID: value)
            XCTAssertNotEqual(result, GameList_DTO())
        }
    }
    
    func testGetFeed() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getFeed(username: value)
            XCTAssertNotEqual(result, UserFeed_DTO())
        }
    }
    
    func testGetUserRankAndScore() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getUserRankAndScore(username: value)
            XCTAssertNotEqual(result, UserRank_DTO())
        }
    }
    
    func testGetUserProgress() async throws {
        try await Cases.users.asyncForEach { (_: String, username: String) in
            
            let result = try await RetroAPI.getUserProgress(username: username, gameIDs: Array(Cases.games.values))
            XCTAssertNotEqual(result, UserProgress_DTO())
            
            try await Cases.games.asyncForEach({ (_: String, gameID: Int) in
                let result = try await RetroAPI.getUserProgress(username: username, gameID: gameID)
                XCTAssertNotEqual(result, UserProgress_DTO())
            })
            
        }
    }
    
    func testGetUserRecentlyPlayedGames() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getUserRecentlyPlayedGames(username: value)
            XCTAssertNotEqual(result, UserRecents_DTO())
        }
    }
    
    func testGetUserSummary() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getUserSummary(username: value)
            XCTAssertNotEqual(result, UserSummary_DTO())
        }
    }
    
    func testGetGameInfoAndUserProgress() async throws {
        try await Cases.users.asyncForEach { (_: String, username: String) in
            try await Cases.games.asyncForEach({ (_: String, gameID: Int) in
                let result = try await RetroAPI.getGameInfoAndUserProgress(username: username, gameID: gameID)
                XCTAssertNotEqual(result, GameInfoAndUserProgress_DTO())
            })
            
        }
    }
    
    func testGetAchievementsEarnedOnDay() async throws {
        let cases = [
            "":("maxmilyin", DateFormatter.date(format: "dd-MMM-yyyy", fromString: "31-Oct-2022")!)
        ]
        try await cases.asyncForEach { (key: String, value: (String, Date)) in
            let result = try await RetroAPI.getAchievementsEarnedOnDay(username: value.0, date: value.1)
            XCTAssertNotEqual(result, AchievementsOnDay_DTO())
        }
    }
    
    func testGetAchievementsEarnedBetween() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getAchievementsEarnedBetween(username: value)
            XCTAssertNotEqual(result, AchievementsBetween_DTO())
        }
    }
    
    func testGetUserCompletedGames() async throws {
        try await Cases.users.asyncForEach { (key: String, value: String) in
            let result = try await RetroAPI.getUserCompletedGames(username: value)
            XCTAssertNotEqual(result, UserCompletedGames_DTO())
        }
    }
    
    func testGetAchievementUnlocks() async throws {
        try await Cases.achievements.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getAchievementUnlocks(achievementID: value)
            XCTAssertNotEqual(result, AchievementUnlocks_DTO())
        }
    }
    
    func testGetAchievementCount() async throws {
        try await Cases.games.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getAchievementCount(gameID: value)
            XCTAssertNotEqual(result, AchievementCount_DTO())
        }
    }
    
    func testGetAchievementOfTheWeek() async throws {
        let result = try await RetroAPI.getAchievementOfTheWeek()
        XCTAssertNotEqual(result, AchievementOfTheWeek_DTO())
    }
    
    func testGetGameRating() async throws {
        try await Cases.games.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getGameRating(gameID: value)
            XCTAssertNotEqual(result, GameRating_DTO())
        }
    }
    
    func testGetTicketData() async throws {
        
        let result = try await RetroAPI.getTicketData()
        XCTAssertNotEqual(result, TicketData_DTO())
        
        try await Cases.tickets.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getTicketData(ticketID: value)
            XCTAssertNotEqual(result, TicketData_DTO())
        }
    }
    
    func testGetUserGameRankAndScore() async throws {
        let cases = [
            "":("wertox123", 785)
        ]
        try await cases.asyncForEach { (_: String, value:(String, Int)) in
            let result = try await RetroAPI.getUserGameRankAndScore(username: value.0, gameID: value.1)
            XCTAssertNotEqual(result, UserGameRankAndScore_DTO())
        }
    }
    
    func testGetGameRankAndScore() async throws {
        let cases = [
            "":10003
        ]
        try await cases.asyncForEach { (key: String, value: Int) in
            let result = try await RetroAPI.getGameRankAndScore(gameID: value)
            XCTAssertNotEqual(result, GameRankAndScore_DTO())
        }
    }
    
    func testGetAchievementDistribution() async throws {
        let result = try await RetroAPI.getAchievementDistribution(gameID: 10003)
        XCTAssertNotEqual(result, [String:Int]())
    }
    
    func testGetUserClaims() async throws {
        let result = try await RetroAPI.getUserClaims()
        XCTAssertNotEqual(result, UserClaims_DTO())
    }
    
    func testGetActiveClaims() async throws {
        let result = try await RetroAPI.getActiveClaims()
        XCTAssertNotEqual(result, UserClaims_DTO())
    }
    
}
final class RetroAPITests_Combine : XCTestCase {
    
    override func setUp() {
        super.setUp()
        RetroAPI.setUserAndKey("wertox123", "NntdFEl8LSxcqcEaud8AN33uRrgAsEBU")
    }
    
    static var allTests = [
        ("testGetTopUsers", testGetTopUsers),
    ]
    
    func testGetTopUsers() throws {
        let result = try awaitPublisher(RetroAPI.getTopTenUsers())
        XCTAssertNotEqual(result, TopUsers_DTO())
    }
    
    func testGetGame() throws {
        try Cases.games.forEach { (key: String, value: Int) in
            print("test:", key, value)
            let result = try awaitPublisher(RetroAPI.getGame(gameID: value))
            XCTAssertNotEqual(result, Game_DTO())
        }
    }
    
    func testGetGameExtended() throws {
        try Cases.games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameExtended(gameID: value))
            XCTAssertNotEqual(result, GameExtended_DTO())
        }
    }
    
    func testGetConsoleIDs() throws {
        let result = try awaitPublisher(RetroAPI.getConsoleIDs())
        XCTAssertNotEqual(result, Consoles_DTO())
    }
    
    func testGetGameList() throws {
        try Cases.consoles.forEach { (key: String, value: Int) in
            print("test:", key, value)
            let result = try awaitPublisher(RetroAPI.getGameList(consoleID: value))
            XCTAssertNotEqual(result, GameList_DTO())
        }
    }
    
    func testGetFeed() throws {
        try Cases.users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getFeed(username: value))
            XCTAssertNotEqual(result, UserFeed_DTO())
        }
    }
    
    func testGetUserRankAndScore() throws {
        try Cases.users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserRankAndScore(username: value))
            XCTAssertNotEqual(result, UserRank_DTO())
        }
    }
    
    func testGetUserProgress() throws {
        try Cases.users.forEach { (_: String, username: String) in
            
            let result = try awaitPublisher(RetroAPI.getUserProgress(username: username, gameIDs: Array(Cases.games.values)))
            XCTAssertNotEqual(result, UserProgress_DTO())
            
            try Cases.games.forEach({ (_: String, gameID: Int) in
                let result = try awaitPublisher(RetroAPI.getUserProgress(username: username, gameID: gameID))
                XCTAssertNotEqual(result, UserProgress_DTO())
            })
            
        }
    }
    
    func testGetUserRecentlyPlayedGames() throws {
        try Cases.users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserRecentlyPlayedGames(username: value))
            XCTAssertNotEqual(result, UserRecents_DTO())
        }
    }
    
    func testGetUserSummary() throws {
        try Cases.users.forEach { (key: String, value: String) in
            print("\(key): \(value)")
            let result = try awaitPublisher(RetroAPI.getUserSummary(username: value))
            XCTAssertEqual(result.user.lowercased(), value.lowercased())
        }
    }
    
    func testGetGameInfoAndUserProgress() throws {
        try Cases.users.forEach { (_: String, username: String) in
            try Cases.games.forEach({ (_: String, gameID: Int) in
                let result = try awaitPublisher(RetroAPI.getGameInfoAndUserProgress(username: username, gameID: gameID))
                XCTAssertNotEqual(result, GameInfoAndUserProgress_DTO())
            })
            
        }
    }
    
    func testGetAchievementsEarnedOnDay() throws {
        let cases = [
            "wertox123":DateFormatter.date(format: "yyyy-MM-dd", fromString: "2021-03-14")!
        ]
        try cases.forEach { (key: String, value: Date) in
            let result = try awaitPublisher(RetroAPI.getAchievementsEarnedOnDay(username: key, date: value))
            XCTAssertFalse(result.isEmpty)
        }
    }
    
    func testGetAchievementsEarnedBetween() throws {
        try Cases.users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getAchievementsEarnedBetween(username: value))
            if (value != "blackspot31") {
                XCTAssertFalse(result.isEmpty)
            } else {
                XCTAssertTrue(result.isEmpty)
            }
        }
    }
    
    func testGetUserCompletedGames() throws {
        try Cases.users.forEach { (key: String, value: String) in
            print("\(key): \(value)")
            let result = try awaitPublisher(RetroAPI.getUserCompletedGames(username: value))
            if (value != "blackspot31") {
                XCTAssertFalse(result.isEmpty)
            } else {
                XCTAssertTrue(result.isEmpty)
            }
        }
    }
    
    func testGetAchievementUnlocks() throws {
        try Cases.achievements.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getAchievementUnlocks(achievementID: value))
            XCTAssertEqual(result.achievement?.achievementID, value)
        }
    }
    
    func testGetAchievementCount() throws {
        try Cases.games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getAchievementCount(gameID: value))
            XCTAssertNotEqual(result, AchievementCount_DTO())
        }
    }
    
    func testGetAchievementOfTheWeek() throws {
        let result = try awaitPublisher(RetroAPI.getAchievementOfTheWeek())
        XCTAssertNotEqual(result, AchievementOfTheWeek_DTO())
    }
    
    func testGetGameRating() throws {
        try Cases.games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameRating(gameID: value))
            XCTAssertNotEqual(result, GameRating_DTO())
        }
    }
    
    func testGetTicketData() throws {
        
        let result = try awaitPublisher(RetroAPI.getTicketData())
        XCTAssertNotEqual(result, TicketData_DTO())
        
        try Cases.tickets.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getTicketData(ticketID: value))
            XCTAssertNotEqual(result, TicketData_DTO())
        }
    }
    
    func testGetUserGameRankAndScore() throws {
        let cases = [
            "":("wertox123", 785)
        ]
        try cases.forEach { (_: String, value:(String, Int)) in
            let result = try awaitPublisher(RetroAPI.getUserGameRankAndScore(username: value.0, gameID: value.1))
            XCTAssertNotEqual(result, UserGameRankAndScore_DTO())
        }
    }
    
    func testGetGameRankAndScore() throws {
        let cases = [
            "":10003
        ]
        try cases.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameRankAndScore(gameID: value))
            XCTAssertNotEqual(result, GameRankAndScore_DTO())
        }
    }
    
    func testGetAchievementDistribution() throws {
        let result = try awaitPublisher(RetroAPI.getAchievementDistribution(gameID: 10003))
        XCTAssertNotEqual(result, [String:Int]())
    }
    
    func testGetUserClaims() throws {
        let result = try awaitPublisher(RetroAPI.getUserClaims())
        XCTAssertNotEqual(result, UserClaims_DTO())
    }
    
    func testGetActiveClaims() throws {
        let result = try awaitPublisher(RetroAPI.getActiveClaims())
        XCTAssertNotEqual(result, UserClaims_DTO())
    }
    
}
final class RetroAPITests_HTTP : XCTestCase {
    
    override func setUp() {
        super.setUp()
        RetroAPI.setUserAndKey("wertox123", "NntdFEl8LSxcqcEaud8AN33uRrgAsEBU")
    }
    
    static var allTests = [
        ("testGetTopUsers", testGetTopUsers),
    ]
    
    func testGetTopUsers() throws {
        RetroAPI.getTopTenUsers(completionHandler: { result in
            XCTAssertNotEqual(result, TopUsers_DTO())
        })
    }
    
    func testGetGame() throws {
        Cases.games.forEach { (key: String, value: Int) in
            RetroAPI.getGame(gameID: value, completionHandler: { result in
                XCTAssertNotEqual(result, Game_DTO())
            })
        }
    }
    
    func testGetGameExtended() throws {
        Cases.games.forEach { (key: String, value: Int) in
            RetroAPI.getGameExtended(gameID: value, completionHandler: { result in
                XCTAssertNotEqual(result, GameExtended_DTO())
            })
        }
    }
    
    func testGetConsoleIDs() throws {
        RetroAPI.getConsoleIDs(completionHandler: { result in
            XCTAssertNotEqual(result, Consoles_DTO())
        })
    }
    
    func testGetGameList() throws {
        Cases.consoles.forEach { (key: String, value: Int) in
            RetroAPI.getGameList(consoleID: value, completionHandler: { result in
                XCTAssertNotEqual(result, GameList_DTO())
            })
        }
    }
    
    func testGetFeed() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getFeed(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, UserFeed_DTO())
            })
        }
    }
    
    func testGetUserRankAndScore() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getUserRankAndScore(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, UserRank_DTO())
            })
        }
    }
    
    func testGetUserProgress() throws {
        Cases.users.forEach { (_: String, username: String) in
            
            RetroAPI.getUserProgress(username: username, gameIDs: Array(Cases.games.values), completionHandler: { result in
                XCTAssertNotEqual(result, UserProgress_DTO())
            })
            
            Cases.games.forEach({ (_: String, gameID: Int) in
                RetroAPI.getUserProgress(username: username, gameID: gameID, completionHandler: { result in
                    XCTAssertNotEqual(result, UserProgress_DTO())
                })
            })
            
        }
    }
    
    func testGetUserRecentlyPlayedGames() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getUserRecentlyPlayedGames(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, UserRecents_DTO())
            })
        }
    }
    
    func testGetUserSummary() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getUserSummary(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, UserSummary_DTO())
            })
        }
    }
    
    func testGetGameInfoAndUserProgress() throws {
        Cases.users.forEach { (_: String, username: String) in
            Cases.games.forEach({ (_: String, gameID: Int) in
                RetroAPI.getGameInfoAndUserProgress(username: username, gameID: gameID, completionHandler: { result in
                    XCTAssertNotEqual(result, GameInfoAndUserProgress_DTO())
                })
            })
            
        }
    }
    
    func testGetAchievementsEarnedOnDay() throws {
        let cases = [
            "":("maxmilyin", DateFormatter.date(format: "dd-MMM-yyyy", fromString: "31-Oct-2022")!)
        ]
        cases.forEach { (key: String, value: (String, Date)) in
            RetroAPI.getAchievementsEarnedOnDay(username: value.0, date: value.1, completionHandler: { result in
                XCTAssertNotEqual(result, AchievementsOnDay_DTO())
            })
        }
    }
    
    func testGetAchievementsEarnedBetween() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getAchievementsEarnedBetween(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, AchievementsBetween_DTO())
            })
        }
    }
    
    func testGetUserCompletedGames() throws {
        Cases.users.forEach { (key: String, value: String) in
            RetroAPI.getUserCompletedGames(username: value, completionHandler: { result in
                XCTAssertNotEqual(result, UserCompletedGames_DTO())
            })
        }
    }
    
    func testGetAchievementUnlocks() throws {
        Cases.achievements.forEach { (key: String, value: Int) in
            RetroAPI.getAchievementUnlocks(achievementID: value, completionHandler: { result in
                XCTAssertNotEqual(result, AchievementUnlocks_DTO())
            })
        }
    }
    
    func testGetAchievementCount() throws {
        Cases.games.forEach { (key: String, value: Int) in
            RetroAPI.getAchievementCount(gameID: value, completionHandler: { result in
                XCTAssertNotEqual(result, AchievementCount_DTO())
            })
        }
    }
    
    func testGetAchievementOfTheWeek() throws {
        RetroAPI.getAchievementOfTheWeek(completionHandler: { result in
            XCTAssertNotEqual(result, AchievementOfTheWeek_DTO())
        })
    }
    
    func testGetGameRating() throws {
        Cases.games.forEach { (key: String, value: Int) in
            RetroAPI.getGameRating(gameID: value, completionHandler: { result in
                XCTAssertNotEqual(result, GameRating_DTO())
            })
        }
    }
    
    func testGetTicketData() throws {
        
        RetroAPI.getTicketData(completionHandler: { result in
            XCTAssertNotEqual(result, TicketData_DTO())
        })
        
        Cases.tickets.forEach { (key: String, value: Int) in
            RetroAPI.getTicketData(ticketID: value, completionHandler: { result in
                XCTAssertNotEqual(result, TicketData_DTO())
            })
        }
    }
    
    func testGetUserGameRankAndScore() throws {
        let cases = [
            "":("wertox123", 785)
        ]
        cases.forEach { (_: String, value:(String, Int)) in
            RetroAPI.getUserGameRankAndScore(username: value.0, gameID: value.1, completionHandler: { result in
                XCTAssertNotEqual(result, UserGameRankAndScore_DTO())
            })
        }
    }
    
    func testGetGameRankAndScore() throws {
        let cases = [
            "":10003
        ]
        cases.forEach { (key: String, value: Int) in
            RetroAPI.getGameRankAndScore(gameID: value, completionHandler: { result in
                XCTAssertNotEqual(result, GameRankAndScore_DTO())
            })
        }
    }
    
    func testGetAchievementDistribution() throws {
        RetroAPI.getAchievementDistribution(gameID: 10003, completionHandler: { result in
            XCTAssertNotEqual(result, [String:Int]())
        })
    }
    
    func testGetUserClaims() throws {
        RetroAPI.getUserClaims(completionHandler: { result in
            XCTAssertNotEqual(result, UserClaims_DTO())
        })
    }
    
    func testGetActiveClaims() throws {
        RetroAPI.getActiveClaims(completionHandler: { result in
            XCTAssertNotEqual(result, UserClaims_DTO())
        })
    }
    
}
final class DoRequestTests_Combine: XCTestCase {

    func testDoRequestLogin() throws {
        let result = try awaitPublisher(DoRequest.doRequestLogin(username: "wertox123", password: ""))
        print(result)
        XCTAssertNotEqual(result, Login_DTO())
    }
    func testDoRequestPing() throws {
        let result = try awaitPublisher(DoRequest.doRequestPing(username: "wertox123", token: ""))
        print(result)
        XCTAssertTrue(result.success ?? false)
    }
    func testDoRequestAwardAchievement() throws {
        let result = try awaitPublisher(DoRequest.doRequestAwardAchievement(username: "", achievementID: -1, token: ""))
        XCTAssertNotEqual(result, AwardAchievement_DTO())
    }
    func testDoRequestGetFriendsList() throws {
        let result = try awaitPublisher(DoRequest.doRequestGetFriendsList(username: "", token: ""))
        XCTAssertNotEqual(result, FriendsList_DTO())
    }
    func testDoRequestGetLBInfo() throws {
        let result = try awaitPublisher(DoRequest.doRequestGetLBInfo(username: "", leaderboardID: -1, count: -1, offset: -1, friendsOnly: false))
        XCTAssertNotEqual(result, LBInfo_DTO())
    }
    func testDoRequestGetAchievementWonDate() throws {
        try Cases.achievements.forEach { (key: String, value: Int) in
            print(key, value)
            let result = try awaitPublisher(DoRequest.doRequestGetAchievementWonDate(username: "wertox123", token: "", achievementID: value, count: 5, offset: 0, friendsOnly: false))
            XCTAssertNotEqual(result, AchievementWonData_DTO())
        }

    }
    
}
final class RetroParse_Combine: XCTestCase {
    
    func testSearchFor() throws {
        let result = try awaitPublisher(RetroParse.searchFor(phrase: "mario", offset: 0))
        XCTAssertNotEqual(result, [SearchResult]())
    }
    
}
