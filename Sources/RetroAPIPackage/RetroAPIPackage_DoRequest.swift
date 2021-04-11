//
//  SwiftUIView.swift
//  
//
//  Created by Clayton Sulby on 4/11/21.
//

import SwiftUI
import Combine

@available(iOS 13.0, *)
public extension RetroAPI {
    
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
        case gameid //MD5
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
        components.path = "dorequest.php" + "?r=" + request.rawValue
        
        return components
    }
    
    static func doRequestLogin(username:String, password:String) -> AnyPublisher<Login_DTO,Error> {
        
        //https://retroachievements.org/dorequest.php?r=login&u=wertox123&p=yuyus123
        var components = baseRequestComponents(.login)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username), URLQueryItem(name: "p", value: password)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    static func doRequestPing(username:String) -> AnyPublisher<Success_DTO,Error> {
        
        var components = baseRequestComponents(.ping)
        components.queryItems?.append(contentsOf: [URLQueryItem(name: "u", value: username)])
        
        let request = URLRequest(url: components.url!)
        
        return agent.run(request)
            .map{$0.value}
            .eraseToAnyPublisher()
        
    }
    
    
}
