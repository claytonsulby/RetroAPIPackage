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

@available(iOS 13.0, *)
public extension DoRequest {
    
    static let agent = Agent()
    
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

}

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
    

}
