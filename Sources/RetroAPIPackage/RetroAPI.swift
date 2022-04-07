//
//  RetroAPI.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/30/21.
//

import Foundation
import Combine

public class RetroAPI {}

public extension RetroAPI {
    
    static var user:String?
    static var key:String?
    
    static func setUser(_ user:String) {
        RetroAPI.user = user
    }
    
    static func setKey(_ key:String) {
        RetroAPI.key = key
    }
    
    static func setUserAndKey(_ user:String, _ key:String) {
        RetroAPI.user = user
        RetroAPI.key = key
    }
    
}

public extension RetroAPI {
    
    ///The base badge url should be concatenated with achievement images:
    /// - Unlocked:         [84220.png](https://s3-eu-west-1.amazonaws.com/i.retroachievements.org/Badge/84220.png)
    /// - Locked:            [84220_lock.png](https://s3-eu-west-1.amazonaws.com/i.retroachievements.org/Badge/84220_lock.png)
    static let baseBadgeURL         = "https://s3-eu-west-1.amazonaws.com/i.retroachievements.org/Badge/"
    
    ///The base image url should be concatenated with game images:
    /// - Image Icon:   [/Images/010564.png](https://retroachievements.org/Images/010564.png)
    /// - Box Art:         [/Images/025692.png](https://retroachievements.org/Images/025692.png)
    static let baseImageURL         = "https://retroachievements.org"

    ///The base user url can be concatenated with a username:
    /// - Profile:      [https://retroachievements.org/user/wertox123]
    static let baseUserURL          = "https://retroachievements.org/user/"
    
    ///The base user pic url can be concatenated with a username:
    /// - Profile Picture:  [/UserPic/wertox123.png](https://retroachievements.org/UserPic/wertox123.png)
    static let baseUserPicURL       = "https://retroachievements.org/UserPic/"
    
    static let baseGameURL          = "https://retroachievements.org/game/"
    static let baseAchievementURL   = "https://retroachievements.org/achievement/"
    
    ///The base forum topic url can be concatenated with a forum topic ID:
    /// - [Example](https://retroachievements.org/viewtopic.php?t=4478)
    static let baseForumTopicURL         = "https://retroachievements.org/viewtopic.php?t="
    
    static let baseAPIURL           = "https://retroachievements.org/API/"
}

public extension RetroAPI {
    
    private enum APIPages : String {
        
        case getAchievementCount = "API_GetAchievementCount"
        case getAchievementOfTheWeek = "API_GetAchievementOfTheWeek"
        case getAchievementUnlocks = "API_GetAchievementUnlocks"
        case getAchievementsEarnedBetween = "API_GetAchievementsEarnedBetween"
        case getAchievementsEarnedOnDay = "API_GetAchievementsEarnedOnDay"
        
        case getConsoleIDs = "API_GetConsoleIDs"
        case getFeed = "API_GetFeed"
        case getGame = "API_GetGame"
        case getGameExtended = "API_GetGameExtended"
        case getGameInfoAndUserProgress = "API_GetGameInfoAndUserProgress"
        case getGameList = "API_GetGameList"
        
        case getGameRankAndScore = "API_GetGameRankAndScore"
        case getGameRating = "API_GetGameRating"
        case getTicketData = "API_GetTicketData"
        case getTopTenUsers = "API_GetTopTenUsers"
        case getUserCompletedGames = "API_GetUserCompletedGames"
        case getUserGameRankAndScore = "API_GetUserGameRankAndScore"
        case getUserProgress = "API_GetUserProgress"
        case getUserRankAndScore = "API_GetUserRankAndScore"
        
        case getUserRecentlyPlayedGames = "API_GetUserRecentlyPlayedGames"
        case getUserSummary = "API_GetUserSummary"
        
    }
    
    private static func baseAPIComponents(_ page:APIPages, username:String? = RetroAPI.user, APIKey:String? = RetroAPI.key) -> URLComponents {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/API/" + page.rawValue + ".php"
        components.queryItems = [URLQueryItem(name: "z", value: username), URLQueryItem(name: "y", value: APIKey)]
        
        return components
        
    }

}

@available(iOS 13.0, macOS 10.15, *)
public extension RetroAPI {
    
    static func validateAPIKey(username: String, APIKey:String) -> AnyPublisher<TopUsers_DTO, Error> {
        
        let components = baseAPIComponents(.getTopTenUsers, username: username, APIKey: APIKey)
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()

    }
    
}

@available(iOS 13.0, macOS 10.15, *)
public extension RetroAPI {

    private static let agent = Agent()
    
    ///Gets list of top 10 users.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetTopTenUsers.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetTopTenUsers.php)
    ///
    /// - Returns: list of TopUsers_DTO objects containing username, RAPoints, TrueRAPoints in that order
    static func getTopTenUsers() -> AnyPublisher<TopUsers_DTO, Error> {
        
        let components = baseAPIComponents(.getTopTenUsers)
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets info about a game from the game's ID number.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGame.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGame.php)
    ///
    /// - parameter gameID: Integer ID associated to game.
    /// - Returns:          GameInfo_DTO object.
    static func getGame(gameID:Int) -> AnyPublisher<Game_DTO,Error> {
        
        var components = baseAPIComponents(.getGame)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: String(gameID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
            
        
    }
    
    ///Gets info about a game as well as all the game's achievements from the game's ID number.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGameExtended.php)
    ///
    /// - parameter gameID: Integer ID associated to game.
    /// - Returns:          ExtendedGameInfo_DTO object.
    static func getGameExtended(gameID:Int) -> AnyPublisher<GameExtended_DTO,Error> {
        
        var components = baseAPIComponents(.getGameExtended)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: String(gameID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets list of consoles.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetConsoleIDs.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetConsoleIDs.php)
    ///
    /// - Returns: List of Console_DTO object containing console name and console ID.
    static func getConsoleIDs() -> AnyPublisher<Consoles_DTO,Error> {
        
        let components = baseAPIComponents(.getConsoleIDs)
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets list of games for a console from the console's ID.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGameList.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=2)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGameList.php)
    ///
    /// - parameter consoleID: Integer ID associated to console.
    /// - Returns: List of GameListElement_DTO containing console info and limited game info.
    static func getGameList(consoleID:Int) -> AnyPublisher<GameList_DTO,Error> {
        
        var components = baseAPIComponents(.getGameList)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: String(consoleID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets list of feed items for a particular user ordered by most recent.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetFeed.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&c=10&o=0)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetFeed.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - count:    The amount of feed items to retreive from the user's feed.
    ///     - offset:   The offset from the most recent feed item to retreive.
    /// - Returns:      List of feed items.
    /// - bug:          Doesn't succeed at the moment.
    static func getFeed(username:String, count:Int, offset:Int = 0) -> AnyPublisher<UserFeed_DTO,Error> {
        
        var components = baseAPIComponents(.getFeed)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user),URLQueryItem(name: "c", value: String(count)),URLQueryItem(name: "o", value: String(offset))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the rank and points of the user given their username.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserRankAndScore.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserRankAndScore.php)
    ///
    /// - parameter username: String indicating the username created through RetroAchievements.org
    /// - Returns: UserRank_DTO object containing point total, rank, and count of all ranked users.
    static func getUserRankAndScore(username:String) -> AnyPublisher<UserRank_DTO,Error> {
        
        var components = baseAPIComponents(.getUserRankAndScore)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the sum of possible points and count of achievements for a game as well as the current sum of points
    ///and count of awarded achievements for a user given their username and a single game's ID or many game IDs.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserProgress.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&i=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserProgress.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - gameID:   Integer ID associated to game.
    /// - Returns: Dictionary of UserProgress_DTO
    static func getUserProgress(username:String, gameID:Int) -> AnyPublisher<UserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "i", value: String(gameID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the sum of possible points and count of achievements for a game as well as the current sum of points
    ///and count of awarded achievements for a user given their username and a single game's ID or many game IDs.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserProgress.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&i=10003,785)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserProgress.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - gameIDs:  Array of Integer IDs associated to game.
    /// - Returns: Dictionary of UserProgress_DTO
    static func getUserProgress(username:String, gameIDs:[Int]) -> AnyPublisher<UserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username),
                                                   URLQueryItem(name: "i", value: gameIDs.map({String($0)}).joined(separator: ","))
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets a specified amount of games recently played by a given user.
    ///The return object contains timestamp of last played, console info, minimal game info, minimal progress info, and user rating of game.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserRecentlyPlayedGames.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&c=10&o=0)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserRecentlyPlayedGames.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - count:    The amount of recently played games to retreive from the user's history.
    ///     - offset:   The offset from the most recently played games to retreive.
    /// - Returns: Array of UserRecent_DTO
    static func getUserRecentlyPlayedGames(username:String, count:Int, offset:Int = 0) -> AnyPublisher<UserRecents_DTO,Error> {
        
        var components = baseAPIComponents(.getUserRecentlyPlayedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "c", value: String(count)),
            URLQueryItem(name: "o", value: String(offset))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets detailed information about a user, detailed information about their most recent game, a list of their other most recent games, and a list of their most recent awarded achievements.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserSummary.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&g=10)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserSummary.php)
    ///
    /// - parameters:
    ///     - username:         String indicating the username created through RetroAchievements.org
    ///     - numRecentGames:   The amount of recently playeg dames to retreive along with the user summary.
    /// - Returns: UserSummary_DTO containing array of recent games, dictionary of progress in games, and dictionary of recent achievements.
    static func getUserSummary(username: String, numRecentGames: Int) -> AnyPublisher<UserSummary_DTO,Error> {
        
        var components = baseAPIComponents(.getUserSummary)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "g", value: String(numRecentGames))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the inforamtion about a game as well as a list of the games achievements including a user's progress for those achievements.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGameInfoAndUserProgress.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&g=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGameInfoAndUserProgress.php)
    ///
    /// - note:         These achievements differ from ``getGameInfo`` in that they include if the achievement is awarded and if so the timestamp.
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - gameID:   Integer ID associated to game.
    /// - Returns: GameInfoAndUserProgress_DTO
    static func getGameInfoAndUserProgress(username:String, gameID:Int) -> AnyPublisher<GameInfoAndUserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getGameInfoAndUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "g", value: String(gameID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the achievements awarded to a user for a given day.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetAchievementsEarnedOnDay.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&d=1629159353960)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetAchievementsEarnedOnDay.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - date:     Swift Date object
    /// - Returns: Array of achievements with limited information.
    /// - bug: Currently returns empty array.
    static func getAchievementsEarnedOnDay(username:String, date:Date) -> AnyPublisher<[AchievementsOnDay_DTO],Error> {
        
        var components = baseAPIComponents(.getAchievementsEarnedOnDay)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "d", value: "\(date.timeIntervalSince1970)")
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets the achievements awarded to a user between two dates.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetAchievementsEarnedBetween.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=Scott&f=0&t=1388577600)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetAchievementsEarnedBetween.php)
    ///
    /// - parameters:
    ///     - username:     String indicating the username created through RetroAchievements.org
    ///     - dateStart:    Swift Date object indicating start of interval
    ///     - dateEnd:      Swift Date object indicating end of interval
    /// - Returns: Array of achievements with limited information.
    /// - bug: Currently returns empty arrey.
    static func getAchievementsEarnedBetween(username:String, dateStart:Date, dateEnd:Date) -> AnyPublisher<[AchievementBetween_DTO],Error> {
        
        var components = baseAPIComponents(.getAchievementsEarnedBetween)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "f", value: "\(dateStart.timeIntervalSince1970)"),
            URLQueryItem(name: "t", value: "\(dateEnd.timeIntervalSince1970)")
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets all games for a user where any progress has been made and includes percentages.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserCompletedGames.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserCompletedGames.php)
    ///
    /// - parameter username: String indicating the username created through RetroAchievements.org
    /// - Returns: Array of UserCompletedGames_DTO, completed games.
    static func getUserCompletedGames(username:String) -> AnyPublisher<UserCompletedGames_DTO,Error> {
        
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets achievement information as well as all users who have been awarded the achievement.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetAchievementUnlocks.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&a=48638)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetAchievementUnlocks.php)
    ///
    /// - parameter achievementID: Integer ID associated to achievement.
    /// - Returns: AchievementUnlocks_DTO including array of Unlock_DTO showing those who have been awarded the achievement.
    static func getAchievementUnlocks(achievementID:Int) -> AnyPublisher<[AchievementUnlocks_DTO],Error> {
        
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "a", value: String(achievementID))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets all achievement IDs for a given game.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetAchievementCount.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetAchievementCount.php)
    ///
    /// - parameter gameID: Integer ID associated to game.
    /// - Returns: AchievementCount_DTO
    static func getAchievementCount(gameID:Int) -> AnyPublisher<AchievementCount_DTO,Error> {
        
        var components = baseAPIComponents(.getAchievementCount)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: String(gameID))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets achievement of the week as well as most recent users who have been awarded the achievement.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetAchievementOfTheWeek.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetAchievementOfTheWeek.php)
    ///
    /// - Returns: AchievementOfTheWeek_DTO
    static func getAchievementOfTheWeek() -> AnyPublisher<AchievementOfTheWeek_DTO,Error> {
        
        let components = baseAPIComponents(.getAchievementOfTheWeek)

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets the rating out of 5 for the game and for the achievement set.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGameRating.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&i=10003)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGameRating.php)
    ///
    /// - parameter gameID: Integer ID associated to game.
    /// - note: An input error will never return a failure and will still return but there will be no ratings.
    /// - Returns: GameRating_DTO
    static func getGameRating(gameID:Int) -> AnyPublisher<GameRating_DTO,Error> {
        
        var components = baseAPIComponents(.getGameRating)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: String(gameID))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets specified achievement set issue ticket or recent tickets if left unspecified.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetTicketData.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetTicketData.php)
    ///
    /// - parameter gameID: Optional integer ID associated to game.
    /// - note: Not specifying a ticketID will return recent tickets.
    /// - Returns: TicketData_DTO
    static func getTicketData(ticketID:Int?) -> AnyPublisher<TicketData_DTO,Error> {
        
        var components = baseAPIComponents(.getTicketData)
        
        if let ticketID = ticketID {
            components.queryItems?.append(contentsOf: [
                URLQueryItem(name: "i", value: String(ticketID))
            ])
        }


        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    ///Gets a user's score and rank in a particular game as well as their last rewarded timestamp.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetUserGameRankAndScore.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&u=wertox123&g=785)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetUserGameRankAndScore.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - gameID:   Integer ID associated to game.
    /// - note: An unknown gameID will return an empty array but an unknown username will return JSON null. A successful return will also be in an array of only one value.
    /// - remark: It may be possible to return more than one result in an array.
    /// - Returns: UserGameRankAndScore_DTO
    static func getUserGameRankAndScore(username:String, gameID:Int) -> AnyPublisher<UserGameRankAndScore_DTO,Error> {
        
        var components = baseAPIComponents(.getUserGameRankAndScore)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "g", value: String(gameID)),
            URLQueryItem(name: "u", value: username)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    ///Gets top 10 users with highest scores for a game.
    ///
    /// - [Example](https://retroachievements.org/API/API_GetGameRankAndScore.php?z=wertox123&y=NntdFEl8LSxcqcEaud8AN33uRrgAsEBU&g=10003&t=0)
    /// - [GitHub Page](https://github.com/RetroAchievements/RAWeb/blob/920c202db30010c9954781d2b4237a7285ee0025/public/API/API_GetGameRankAndScore.php)
    ///
    /// - parameters:
    ///     - username: String indicating the username created through RetroAchievements.org
    ///     - type:     0 or 1 (see remark.)
    /// - precondition: type is 0 or 1
    /// - note: a count and offset parameter are found in the github but are currently hardcoded to c=10 & o=0.
    /// - remark: I cannot identify what type means but it can be found in the github page as either 0 or 1.
    /// - Returns:
    static func getGameRankAndScore(gameID:Int, type:Int) -> AnyPublisher<GameRankAndScore_DTO,Error> {
        
        var components = baseAPIComponents(.getGameRankAndScore)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "g", value: String(gameID)),
            URLQueryItem(name: "t", value: String(type))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

}

@available(macOS 10.15, *)
public extension RetroAPI {
    
    static func getTopTenUsers(completionHandler: @escaping (TopUsers_DTO) -> Void) {
        
        let components = baseAPIComponents(.getTopTenUsers)
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(TopUsers_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGameInfo(_ gameID:String, completionHandler: @escaping (Game_DTO) -> Void) {
        var components = baseAPIComponents(.getGame)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(Game_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGameInfoExtended(_ gameID:String, completionHandler: @escaping (GameExtended_DTO) -> Void) {
        var components = baseAPIComponents(.getGameExtended)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(GameExtended_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getConsoleIDs(completionHandler: @escaping (Consoles_DTO) -> Void) {
        let components = baseAPIComponents(.getConsoleIDs)

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(Consoles_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGameList(_ consoleID:String, completionHandler: @escaping (GameList_DTO) -> Void) {
        var components = baseAPIComponents(.getGameList)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: consoleID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(GameList_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getFeedFor(user:String, count:Int, offset:Int = 0, completionHandler: @escaping (UserFeed_DTO) -> Void) {
        //FIXME: only returns failure
        var components = baseAPIComponents(.getFeed)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user),URLQueryItem(name: "c", value: String(count)),URLQueryItem(name: "o", value: String(offset))])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserFeed_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserRankAndScore(_ user:String, completionHandler: @escaping (UserRank_DTO) -> Void) {
        var components = baseAPIComponents(.getUserRankAndScore)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserRank_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserProgress(user:String, gameID:String, completionHandler: @escaping (UserProgress_DTO) -> Void) {
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "i", value: gameID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserProgress_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserProgress(user:String, gameIDs:[String], completionHandler: @escaping (UserProgress_DTO) -> Void) {
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "i", value: gameIDs.joined(separator: ","))])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserProgress_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserRecentlyPlayedGames(user:String, count:Int, offset:Int = 0, completionHandler: @escaping (UserRecents_DTO) -> Void) {
        var components = baseAPIComponents(.getUserRecentlyPlayedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "c", value: String(count)),
            URLQueryItem(name: "o", value: String(offset))
        ])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserRecents_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserSummary(user:String, numRecentGames:Int, completionHandler: @escaping (UserSummary_DTO) -> Void) {
        var components = baseAPIComponents(.getUserSummary)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "g", value: String(numRecentGames))])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserSummary_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGameInfoAndUserProgress(user:String, gameID:String, completionHandler: @escaping (GameInfoAndUserProgress_DTO) -> Void) {
        var components = baseAPIComponents(.getGameInfoAndUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "g", value: String(gameID))])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(GameInfoAndUserProgress_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAchievementsEarnedOnDay(user:String, date:Date, completionHandler: @escaping (AchievementsOnDay_DTO) -> Void) {
        var components = baseAPIComponents(.getAchievementsEarnedOnDay)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "d", value: "\(date.timeIntervalSince1970)")
        ])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementsOnDay_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    static func getAchievementsEarnedBetween(user:String, dateStart:Date, dateEnd:Date, completionHandler: @escaping (AchievementBetween_DTO) -> Void) {
        var components = baseAPIComponents(.getAchievementsEarnedBetween)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "f", value: "\(dateStart.timeIntervalSince1970)"),
            URLQueryItem(name: "t", value: "\(dateEnd.timeIntervalSince1970)")
        ])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementBetween_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUserGamesCompleted(user:String, completionHandler: @escaping (UserCompletedGames_DTO) -> Void) {
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user)
        ])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserCompletedGames_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func getAchievementUnlocks(achievementID:String, completionHandler: @escaping (AchievementUnlocks_DTO) -> Void) {
        
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "a", value: achievementID)
        ])

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementUnlocks_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    static func getAchievementCount(gameID:String, completionHandler: @escaping (AchievementCount_DTO) -> Void) {
        
        var components = baseAPIComponents(.getAchievementCount)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: gameID)
        ])

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementCount_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    static func getAchievementOfTheWeek(completionHandler: @escaping (AchievementOfTheWeek_DTO) -> Void) {
        
        let components = baseAPIComponents(.getAchievementOfTheWeek)

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementOfTheWeek_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func getGameRating(gameID:String, completionHandler: @escaping (GameRating_DTO) -> Void) {
        
        var components = baseAPIComponents(.getGameRating)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: gameID)
        ])

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(GameRating_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    static func getTicketData(gameID:String, completionHandler: @escaping (TicketData_DTO) -> Void) {
        
        let components = baseAPIComponents(.getTicketData)

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(TicketData_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    static func getUserGameRankAndScore(username:String, gameID:String, completionHandler: @escaping (UserGameRankAndScore_DTO) -> Void) {
        
        var components = baseAPIComponents(.getUserGameRankAndScore)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "g", value: gameID),
            URLQueryItem(name: "u", value: username)
        ])

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserGameRankAndScore_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }

    static func getGameRankAndScore(gameID:String, type:String, completionHandler: @escaping (UserGameRankAndScore_DTO) -> Void) {
        
        var components = baseAPIComponents(.getGameRankAndScore)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "g", value: gameID),
            URLQueryItem(name: "t", value: type)
        ])

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(UserGameRankAndScore_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}
