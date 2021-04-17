//
//  GameService.swift
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
    static let baseBadgeURL = "https://s3-eu-west-1.amazonaws.com/i.retroachievements.org/Badge/"
    static let baseImageURL = "https://retroachievements.org"
}

public extension RetroAPI {
    
    private enum APIPages : String {
        case getTopTenUsers = "API_GetTopTenUsers"
        case getGameInfo = "API_GetGame"
        case getGameInfoExtended = "API_GetGameExtended"
        case getConsoleIDs = "API_GetConsoleIDs"
        case getGameList = "API_GetGameList"
        case getFeedFor = "API_GetFeed"
        case getUserRankAndScore = "API_GetUserRankAndScore"
        case getUserProgress = "API_GetUserProgress"
        case getUserRecentlyPlayedGames = "API_GetUserRecentlyPlayedGames"
        case getUserSummary = "API_GetUserSummary"
        case getGameInfoAndUserProgress = "API_GetGameInfoAndUserProgress"
        case getAchievementsEarnedOnDay = "API_GetAchievementsEarnedOnDay"
        case getAchievementsEarnedBetween = "API_GetAchievementsEarnedBetween"
        case getUserCompletedGames = "API_GetUserCompletedGames"
        case getAchievementUnlocks = "API_GetAchievementUnlocks"
        case getAchievementCount = "API_GetAchievementCount"
        case getAchievementOfTheWeek = "API_GetAchievementOfTheWeek"
        case getGameRating = "API_GetGameRating"
        case getTicketData = "API_GetTicketData"
        case getUserGameRankAndScore = "API_GetUserGameRankAndScore"
    }
    
    private static func baseAPIComponents(_ page:APIPages) -> URLComponents {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/API/" + page.rawValue + ".php"
        components.queryItems = [URLQueryItem(name: "z", value: RetroAPI.user), URLQueryItem(name: "y", value: RetroAPI.key)]
        
        return components
        
    }
}


@available(iOS 13.0, *)
public extension RetroAPI {

    static let agent = Agent()
    
    static func getTopTenUsers() -> AnyPublisher<TopUsers_DTO, Error> {
        
        let components = baseAPIComponents(.getTopTenUsers)
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
        
    static func getGameInfo(_ gameID:String) -> AnyPublisher<GameInfo_DTO,Error> {
        
        var components = baseAPIComponents(.getGameInfo)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    //  https://retroachievements.org/API/API_GetGameExtended.php?z=wertox123&y=<>&i=201
    static func getGameInfoExtended(_ gameID:String) -> AnyPublisher<ExtendedGameInfo_DTO,Error> {
        
        var components = baseAPIComponents(.getGameInfoExtended)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getConsoleIDs() -> AnyPublisher<ConsoleIDs_DTO,Error> {
        
        let components = baseAPIComponents(.getConsoleIDs)
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getGameList(consoleID:String) -> AnyPublisher<GameList_DTO,Error> {
        
        var components = baseAPIComponents(.getGameList)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: consoleID)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getFeedFor(user:String, count:Int, offset:Int = 0) -> AnyPublisher<UserFeed_DTO,Error> { //FIXME: only returns {"success":false}
        
        var components = baseAPIComponents(.getFeedFor)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user),URLQueryItem(name: "c", value: String(count)),URLQueryItem(name: "o", value: String(offset))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    //When user doesn't exist handle:
    //{"Score":null,"Rank":1,"TotalRanked":"93827"}
    static func getUserRankAndScore(user:String) -> AnyPublisher<UserRank_DTO,Error> {
        
        var components = baseAPIComponents(.getUserRankAndScore)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getUserProgress(user:String, gameID:String) -> AnyPublisher<UserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "i", value: gameID)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getUserProgress(user:String, gameIDs:[String]) -> AnyPublisher<UserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "i", value: gameIDs.joined(separator: ","))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getUserRecentlyPlayedGames(user:String, count:Int, offset:Int = 0) -> AnyPublisher<[UserRecent_DTO],Error> {
        
        var components = baseAPIComponents(.getUserRecentlyPlayedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "c", value: String(count)),
            URLQueryItem(name: "o", value: String(offset))
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    //FIXME: if username doesn't exist handle this:
    //{"ID":null,"User":"<username here>"}
    static func getUserSummary(user: String, numRecentGames: Int) -> AnyPublisher<UserSummary_DTO,Error> {
        
        var components = baseAPIComponents(.getUserSummary)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "g", value: String(numRecentGames))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    

    static func getGameInfoAndUserProgress(user:String, gameID:String) -> AnyPublisher<GameInfoAndUserProgress_DTO,Error> {
        
        var components = baseAPIComponents(.getGameInfoAndUserProgress)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: user), URLQueryItem(name: "g", value: String(gameID))])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getAchievementsEarnedOnDay(user:String, date:Date) -> AnyPublisher<[AchievementsOnDay_DTO],Error> { //FIXME: returns nothing
        
        var components = baseAPIComponents(.getAchievementsEarnedOnDay)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "d", value: "\(date.timeIntervalSince1970)")
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getAchievementsEarnedBetween(user:String, dateStart:Date, dateEnd:Date) -> AnyPublisher<[Achievement_DTO],Error> {
        
        var components = baseAPIComponents(.getAchievementsEarnedBetween)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "f", value: "\(dateStart.timeIntervalSince1970)"),
            URLQueryItem(name: "t", value: "\(dateEnd.timeIntervalSince1970)")
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getUserGamesCompleted(user:String) -> AnyPublisher<UserCompletedGames_DTO,Error> {
        
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getAchievementUnlocks(achievementID:String) -> AnyPublisher<AchievementUnlocks_DTO,Error> {
        
        var components = baseAPIComponents(.getUserCompletedGames)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "a", value: achievementID)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getAchievementCount(gameID:String) -> AnyPublisher<AchievementCount_DTO,Error> {
        
        var components = baseAPIComponents(.getAchievementCount)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: gameID)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getAchievementOfTheWeek() -> AnyPublisher<AchievementOfTheWeek_DTO,Error> {
        
        let components = baseAPIComponents(.getAchievementOfTheWeek)

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func getGameRating(gameID:String) -> AnyPublisher<GameRating_DTO,Error> {
        
        var components = baseAPIComponents(.getGameRating)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "i", value: gameID)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getTicketData(gameID:String) -> AnyPublisher<TicketData_DTO,Error> {
        
        let components = baseAPIComponents(.getTicketData)

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

    static func getUserGameRankAndScore(username:String, gameID:String) -> AnyPublisher<UserGameRankAndScore_DTO,Error> {
        
        var components = baseAPIComponents(.getUserGameRankAndScore)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "g", value: gameID),
            URLQueryItem(name: "u", value: username)
        ])

        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

}

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
    
    static func getGameInfo(_ gameID:String, completionHandler: @escaping (GameInfo_DTO) -> Void) {
        var components = baseAPIComponents(.getGameInfo)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(GameInfo_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGameInfoExtended(_ gameID:String, completionHandler: @escaping (ExtendedGameInfo_DTO) -> Void) {
        var components = baseAPIComponents(.getGameInfoExtended)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "i", value: gameID)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(ExtendedGameInfo_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getConsoleIDs(completionHandler: @escaping (ConsoleIDs_DTO) -> Void) {
        let components = baseAPIComponents(.getConsoleIDs)

        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(ConsoleIDs_DTO.self, from: data))
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
        var components = baseAPIComponents(.getFeedFor)
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
    
    
    
    static func getAchievementsEarnedBetween(user:String, dateStart:Date, dateEnd:Date, completionHandler: @escaping (Achievement_DTO) -> Void) {
        var components = baseAPIComponents(.getAchievementsEarnedBetween)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: user),
            URLQueryItem(name: "f", value: "\(dateStart.timeIntervalSince1970)"),
            URLQueryItem(name: "t", value: "\(dateEnd.timeIntervalSince1970)")
        ])
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(Achievement_DTO.self, from: data))
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
    
    
}
