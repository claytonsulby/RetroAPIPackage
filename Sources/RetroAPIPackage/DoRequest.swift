//
//  SwiftUIView.swift
//  
//
//  Created by Clayton Sulby on 4/11/21.
//

import SwiftUI
import Combine

public enum DoRequest {
    
    enum RequestType : String {
        case achievementwondata
        case awardachievement
        case getfriendlist
        case patch
        case postactivity
        case richpresencepatch
        case submitcodenote
        case submitgametitle
        case submitlbentry
        case unlocks
        case uploadachievement
        case login
        case allprogress
        case badgeiter
        case codenotes
        case codenotes2
        case gameid //from MD5
        case gameslist
        case officialgameslist
        case hashlibrary
        case latestclient
        case latestintegration
        case ping
        case lbinfo
        case submitticket
    }
    
    
    static func baseRequestComponents(_ request:RequestType) -> URLComponents {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/dorequest.php"
        components.queryItems = [URLQueryItem(name: "r", value: request.rawValue)]
        
        return components
    }
}

@available(iOS 13.0, macOS 10.15, *)
public extension DoRequest {
    
    private static let agent = Agent()

    static func doRequestLogin(username:String, password:String) -> AnyPublisher<Login_DTO,Error> {

        var components = baseRequestComponents(.login)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "p", value: password)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestPing(username:String, token:String) -> AnyPublisher<Success_DTO,Error> {
        
        var components = baseRequestComponents(.ping)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "t", value: token)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
    }

    static func doRequestAwardAchievement(username:String, achievementID:Int, hardcoreEnabled:Bool = false, token:String) -> AnyPublisher<AwardAchievement_DTO,Error> {
        
        let achievementID = String(achievementID)
        let hardcore = String(hardcoreEnabled == true ? 1 : 0)
        
        var components = baseRequestComponents(.awardachievement)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "a", value: achievementID),
            URLQueryItem(name: "h", value: hardcore),
            URLQueryItem(name: "t", value: token),
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestGetFriendsList(username:String, token:String) -> AnyPublisher<FriendsList_DTO,Error> {

        var components = baseRequestComponents(.getfriendlist)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "t", value: token),
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestPostActivity(username: String, token: String, activityType: String, message: String) -> AnyPublisher<PostActivity_DTO,Error> {

        var components = baseRequestComponents(.postactivity)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "t", value: token),
            URLQueryItem(name: "a", value: activityType),
            URLQueryItem(name: "m", value: message),
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestGetLBInfo(username: String, leaderboardID:Int, count:Int, offset:Int, friendsOnly:Bool) -> AnyPublisher<LBInfo_DTO, Error> {
        
        let leaderboardID = String(leaderboardID)
        let count = String(count)
        let offset = String(offset)
        let friendsOnly = String(friendsOnly == true ? 1 : 0)
        
        var components = baseRequestComponents(.lbinfo)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "i", value: leaderboardID),
            URLQueryItem(name: "c", value: count),
            URLQueryItem(name: "o", value: offset),
            URLQueryItem(name: "f", value: friendsOnly),
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestGetAchievementWonDate(username: String, token:String, achievementID:Int, count:Int, offset:Int, friendsOnly:Bool) -> AnyPublisher<AchievementWonData_DTO, Error> {
        
        let achievementID = String(achievementID)
        let count = String(count)
        let offset = String(offset)
        let friendsOnly = String(friendsOnly == true ? 1 : 0)
        
        var components = baseRequestComponents(.achievementwondata)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "t", value: token),
            URLQueryItem(name: "a", value: achievementID),
            URLQueryItem(name: "c", value: count),
            URLQueryItem(name: "o", value: offset),
            URLQueryItem(name: "f", value: friendsOnly),
        ])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }

}

@available(iOS 13.0, macOS 10.15, *)
public extension DoRequest {

    static func doRequestLogin(username:String, password:String, completionHandler: @escaping (Login_DTO) -> Void) {

        var components = baseRequestComponents(.login)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "p", value: password)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(Login_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    static func doRequestPing(username:String, completionHandler: @escaping (Success_DTO) -> Void) {
        
        var components = baseRequestComponents(.ping)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username)])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(Success_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func doRequestAwardAchievement(username:String, achievementID:Int, hardcoreEnabled:Bool = false, token:String, completionHandler: @escaping (AwardAchievement_DTO) -> Void) {
        
        let achievementID = String(achievementID)
        let hardcore = String(hardcoreEnabled == true ? 1 : 0)
        
        var components = baseRequestComponents(.awardachievement)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "a", value: achievementID),
            URLQueryItem(name: "h", value: hardcore),
            URLQueryItem(name: "t", value: token),
        ])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AwardAchievement_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func doRequestGetFriendsList(username:String, token:String, completionHandler: @escaping (FriendsList_DTO) -> Void) {

        var components = baseRequestComponents(.getfriendlist)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "t", value: token),
        ])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(FriendsList_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func doRequestGetLBInfo(username: String, leaderboardID:Int, count:Int, offset:Int, friendsOnly:Bool, completionHandler: @escaping (LBInfo_DTO) -> Void) {
        
        let leaderboardID = String(leaderboardID)
        let count = String(count)
        let offset = String(offset)
        let friendsOnly = String(friendsOnly == true ? 1 : 0)
        
        var components = baseRequestComponents(.lbinfo)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "i", value: leaderboardID),
            URLQueryItem(name: "c", value: count),
            URLQueryItem(name: "o", value: offset),
            URLQueryItem(name: "f", value: friendsOnly),
        ])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(LBInfo_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    static func doRequestGetAchievementWonDate(username: String, token:String, achievementID:Int, count:Int, offset:Int, friendsOnly:Bool, completionHandler: @escaping (AchievementWonData_DTO) -> Void) {
        
        let achievementID = String(achievementID)
        let count = String(count)
        let offset = String(offset)
        let friendsOnly = String(friendsOnly == true ? 1 : 0)
        
        var components = baseRequestComponents(.achievementwondata)
        components.queryItems?.append(contentsOf: [
            URLQueryItem(name: "u", value: username),
            URLQueryItem(name: "t", value: token),
            URLQueryItem(name: "a", value: achievementID),
            URLQueryItem(name: "c", value: count),
            URLQueryItem(name: "o", value: offset),
            URLQueryItem(name: "f", value: friendsOnly),
        ])
        
        agent.makeRequest(components.url!) { data in
            do {
                completionHandler(try JSONDecoder().decode(AchievementWonData_DTO.self, from: data))
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    

}
