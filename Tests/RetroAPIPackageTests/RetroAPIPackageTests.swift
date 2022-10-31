import XCTest
import Combine
@testable import RetroAPIPackage

extension XCTestCase {
    func awaitPublisher<T: Publisher>(
        _ publisher: T,
        timeout: TimeInterval = 10,
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

final class RetroAPIPackageTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    private let games = [
        "complete":10003,
        "nullFlag":3,
        "~Z~":20140,
        "~Hack~":14972
    ]
    let consoles = [
//        "0":0,
//        "1":1,
//        "2":2,
//        "3":3,
        "4":4
//        "5":5,
//        "6":6,
//        "7":7,
//        "8":8,
//        "9":9,
//        "10":10,
//        "11":11,
//        "12":12,
//        "13":13,
//        "14":14,
//        "15":15,
//        "16":16,
//        "17":17,
//        "18":18,
//        "19":19,
//        "20":20,
//        "21":21,
//        "22":22,
//        "23":23,
//        "24":24,
//        "25":25,
//        "26":26,
//        "27":27,
//        "28":28,
//        "29":29,
//        "30":30,
//        "31":31,
//        "32":32,
//        "33":33,
//        "34":34,
//        "35":35,
//        "36":36,
//        "37":37,
//        "38":38,
//        "39":39,
//        "40":40,
//        "41":41,
//        "42":42,
//        "43":43,
//        "44":44,
//        "45":45,
//        "46":46,
//        "47":47,
//        "48":48,
//        "49":49,
//        "50":50
    ]
    let users = [
        "me":"wertox123",
        "veteren":"maxmilyin",
//        "new player":"blackspot31"
//        "banned":"blazekickn"
        "Scott":"Scott"
    ]
    let achievements = [
        "a":48638
    ]
    let tickets = [
        "a":1
    ]

    override func setUp() {
        super.setUp()
        cancellables = []
        RetroAPI.setUserAndKey("wertox123", "NntdFEl8LSxcqcEaud8AN33uRrgAsEBU")
    }
    
    func testGetTopUsers() throws {
        let result = try awaitPublisher(RetroAPI.getTopTenUsers())
        XCTAssertNotEqual(result, TopUsers_DTO())
    }

    func testGetGame() throws {
        try games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGame(gameID: value))
            XCTAssertNotEqual(result, Game_DTO())
        }
    }
    
    func testGetGameExtended() throws {
        try games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameExtended(gameID: value))
            XCTAssertNotEqual(result, GameExtended_DTO())
        }
    }
    
    func testGetConsoleIDs() throws {
        let result = try awaitPublisher(RetroAPI.getConsoleIDs())
        XCTAssertNotEqual(result, Consoles_DTO())
    }
    
    func testGetGameList() throws {
        try consoles.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameList(consoleID: value))
            XCTAssertNotEqual(result, GameList_DTO())
        }
    }
    
    func testGetFeed() throws {
//        try users.forEach { (key: String, value: String) in
//            let result = try awaitPublisher(RetroAPI.getFeed(username: value, count: 1))
//            XCTAssertNotEqual(result, UserFeed_DTO())
//        }
    }
    
    func testGetUserRankAndScore() throws {
        try users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserRankAndScore(username: value))
            XCTAssertNotEqual(result, UserRank_DTO())
        }
    }
    
    func testGetUserProgress() throws {
        try users.forEach { (_: String, username: String) in
            
            let result = try awaitPublisher(RetroAPI.getUserProgress(username: username, gameIDs: Array(games.values)))
            XCTAssertNotEqual(result, UserProgress_DTO())
            
            try games.forEach({ (_: String, gameID: Int) in
                let result = try awaitPublisher(RetroAPI.getUserProgress(username: username, gameID: gameID))
                XCTAssertNotEqual(result, UserProgress_DTO())
            })

        }
    }
    
    func testGetUserRecentlyPlayedGames() throws {
        try users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserRecentlyPlayedGames(username: value))
            XCTAssertNotEqual(result, UserRecents_DTO())
        }
    }
    
    func testGetUserSummary() throws {
        try users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserSummary(username: value))
            XCTAssertNotEqual(result, UserSummary_DTO())
        }
    }
    
    func testGetGameInfoAndUserProgress() throws {
        try users.forEach { (_: String, username: String) in
            try games.forEach({ (_: String, gameID: Int) in
                let result = try awaitPublisher(RetroAPI.getGameInfoAndUserProgress(username: username, gameID: gameID))
                XCTAssertNotEqual(result, GameInfoAndUserProgress_DTO())
            })

        }
    }
    
    func testGetAchievementsEarnedOnDay() throws {
//        try users.forEach { (key: String, value: String) in
//            let result = try awaitPublisher(RetroAPI.getAchievementsEarnedOnDay(username: value, date: Date()))
//            XCTAssertNotEqual(result, AchievementsOnDay_DTO())
//        }
    }
    
    func testGetAchievementsEarnedBetween() throws {
        try users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getAchievementsEarnedBetween(username: value))
            XCTAssertNotEqual(result, AchievementsBetween_DTO())
        }
    }
    
    func testGetUserCompletedGames() throws {
        try users.forEach { (key: String, value: String) in
            let result = try awaitPublisher(RetroAPI.getUserCompletedGames(username: value))
            XCTAssertNotEqual(result, UserCompletedGames_DTO())
        }
    }
    
    //FAILSSSS
    func testGetAchievementUnlocks() throws {
        try achievements.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getAchievementUnlocks(achievementID: value))
            XCTAssertNotEqual(result, AchievementUnlocks_DTO())
        }
    }
    
    func testGetAchievementCount() throws {
        try games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getAchievementCount(gameID: value))
            XCTAssertNotEqual(result, AchievementCount_DTO())
        }
    }
    
    func testGetAchievementOfTheWeek() throws {
        let result = try awaitPublisher(RetroAPI.getAchievementOfTheWeek())
        XCTAssertNotEqual(result, AchievementOfTheWeek_DTO())
    }
    
    func testGetGameRating() throws {
        try games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameRating(gameID: value))
            XCTAssertNotEqual(result, GameRating_DTO())
        }
    }
    
    func testGetTicketData() throws {
        
        let result = try awaitPublisher(RetroAPI.getTicketData())
        XCTAssertNotEqual(result, TicketData_DTO())
        
        try tickets.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getTicketData(ticketID: value))
            XCTAssertNotEqual(result, TicketData_DTO())
        }
    }
    
    func testGetUserGameRankAndScore() throws {
        try users.forEach { (_: String, username: String) in
            try games.forEach({ (_: String, gameID: Int) in
                let result = try awaitPublisher(RetroAPI.getUserGameRankAndScore(username: username, gameID: gameID))
                XCTAssertNotEqual(result, UserGameRankAndScore_DTO())
            })

        }
    }
    
    func testGetGameRankAndScore() throws {
        try games.forEach { (key: String, value: Int) in
            let result = try awaitPublisher(RetroAPI.getGameRankAndScore(gameID: value))
            XCTAssertNotEqual(result, GameRankAndScore_DTO())
        }
    }

    
    static var allTests = [
        ("testGetTopUsers", testGetTopUsers),
    ]
}
