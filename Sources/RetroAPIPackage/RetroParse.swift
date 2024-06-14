//
//  RetroParse.swift
//  JSFun
//
//  Created by Clayton Sulby on 8/9/21.
//

import Foundation
import SwiftSoup
import Combine

public enum RetroParse {
    
    static func getSearchResults(html:String) -> [SearchResult]? {
        do {
            let doc: Document = try SwiftSoup.parse(html)
            let mainpage:Element? = try doc.select("div").array().first(where: { try $0.attr("id") == "mainpage"})
            var table:[Element]? = try mainpage?.select("table").select("tr").array()
            if table?.count ?? 0 >= 1 { table?.removeFirst() }
            let tableRows = try table?.map({ tableRow -> [Element] in
                try tableRow.select("td").array()
            })
            
            let searchRows = try tableRows?.map({ (row) -> SearchResult? in
                
                let type = SearchType(rawValue: try row[0].text()) ?? .none
                
                switch type {
                case .game:
                    
                    let id = try row[safe: 1]?.select("a").first?.attr("href").deletingPrefix("https://retroachievements.org/game/")
                    let image = try row[safe: 1]?.select("img").first?.attr("src")
                    let name = try row[safe: 1]?.text()
                    
                    return SearchResult(type: type, primary: name, secondary: id, image: image)
                    
                case .user:
                    
                    let username = try row[safe: 1]?.text()
                    let image = RetroAPI.baseImageURL + "/UserPic/" + (username ?? "") + ".png"
                    
                    return SearchResult(type: type, primary: username, image: image)
                    
                case .achievment:
                    
                    let image = try row[safe: 1]?.select("img").first?.attr("src")
                    let title = try row[safe: 1]?.text()
                    let achievementId = try row[safe: 1]?.select("a").attr("href").deletingPrefix("https://retroachievements.org/achievement/")
                    
                    return SearchResult(type: type, primary: title, secondary: achievementId, image: ParseUtil.parse(image: image))
                    
                case .gameComment:
                    
                    let username = try row[1].text()
                    let image = RetroAPI.baseImageURL + "/UserPic/" + username + ".png"
                    let text = try row[2].text()
                    
                    return SearchResult(type: type, primary: text, secondary: nil, tertiary: nil, username: username, image: image)
                    
                case .forumComment:
                    
                    let username = try row[1].select("span").first?.select("a").first?.attr("href").deletingPrefix("/user/")
                    let image = RetroAPI.baseImageURL + "/UserPic/" + (username ?? "") + ".png"
                    
                    let url = try row[2].select("a").attr("href")
                    let thread = url.slice(from: "=", to:"&")
                    let comment = url.slice(after: "=")
                    
                    let text = try row[2].text()
                    
                    return SearchResult(type: type, primary: text, secondary: thread, tertiary: comment, username: username, image: image)
                    
                case .ticketComment:
                    
                    let username = try row[1].text()
                    let image = RetroAPI.baseImageURL + "/UserPic/" + username + ".png"
                    let text = try row[2].text()
                    
                    
                    return SearchResult(type: type, primary: text, secondary: nil, tertiary: nil, username: username, image: image)
                    
                default:
                    return nil
                }
            })
            return searchRows?.compactMap({ $0 })
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        return nil
    }
    
    static func searchFor(phrase: String, offset:Int) -> AnyPublisher<[SearchResult], Error>  {
        
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/searchresults.php"
        components.queryItems = [URLQueryItem(name: "s", value: String(phrase)),
                                 URLQueryItem(name: "o", value: String(offset))
        ]
        
        return URLSession.shared
            .dataTaskPublisher(for: components.url!)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .map({ data -> String in
                return String(data: data, encoding: .ascii) ?? ""
            })
            .map({ html -> [SearchResult] in
                self.getSearchResults(html: html) ?? []
            })
            .eraseToAnyPublisher()
    }
    
//    static func searchMusic(phrases:[String], offset:Int? = nil) -> AnyPublisher<[SearchResult], Error> {
//        var components = URLComponents()
//
//        components.scheme = "https"
//        components.host = "downloads.khinsider.com"
//        components.path = "/search"
//        components.queryItems = [URLQueryItem(name: "search", value: String(phrases.joined(separator: "+")))]
//
//        return URLSession.shared
//            .dataTaskPublisher(for: components.url!)
//            .tryMap() { element -> Data in
//                guard let httpResponse = element.response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                return element.data
//            }
//            .map({ data -> String in
//                return String(data: data, encoding: .ascii) ?? ""
//            })
//            .map({ html -> [SearchResult] in
//                self.getMusicResults(html: html) ?? []
//            })
//            .map({ results -> [SearchResult] in
//                guard let offset = offset else { return results }
//                if results.indices.contains(offset) {
//                    return Array(results[offset...].prefix(10))
//                } else { return [] }
//            })
//            .eraseToAnyPublisher()
//    }
    
//    static func searchMusic(phrase:String, offset:Int? = nil) -> AnyPublisher<[SearchResult], Error> {
//        var components = URLComponents()
//
//        components.scheme = "https"
//        components.host = "downloads.khinsider.com"
//        components.path = "/search"
//        components.queryItems = [URLQueryItem(name: "search", value: String(phrase))]
//
//        return URLSession.shared
//            .dataTaskPublisher(for: components.url!)
//            .tryMap() { element -> Data in
//                guard let httpResponse = element.response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//                    throw URLError(.badServerResponse)
//                }
//                return element.data
//            }
//            .map({ data -> String in
//                return String(data: data, encoding: .ascii) ?? ""
//            })
//            .map({ html -> [SearchResult] in
//                self.getMusicResults(html: html) ?? []
//            })
//            .map({ results -> [SearchResult] in
//                guard let offset = offset else { return results }
//                if results.indices.contains(offset) {
//                    return Array(results[offset...].prefix(10))
//                } else { return [] }
//            })
//            .eraseToAnyPublisher()
//    }
    
//    static func getMusicResults(html:String) -> [SearchResult]? {
//        do {
//            let doc: Document = try SwiftSoup.parse(html)
//            let div = try doc.select("div").array().first(where: { $0.id() == "EchoTopic" })
//            let p = try div?.select("a").array()
//
//            let results = try p?.map({ row -> SearchResult in
//                let text = try row.text()
//                let link = try row.attr("href")
//                return SearchResult(type: .music, primary: text, secondary: link)
//            })
//            return results
//        }catch Exception.Error(_, let message) {
//            print(message)
//        } catch {
//            print("error")
//        }
//        return nil
//    }
}

extension RetroParse {
    
    static func getUserRowsFromHTML(html:String) -> [UserRow]? { //FIXME: optimize and make robust
        do {
            let doc: Document = try SwiftSoup.parse(html)
            var table:[Element]? = try doc.select("tr").array()
            let shouldIncludeRank = try table?.first?.select("th").array().count == 5
            table?.removeFirst()
            let rows = try table?.compactMap({ tableRow -> UserRow? in
                
                let td = try tableRow.select("td").array()
                
                
                
                if shouldIncludeRank {
                    
                    if (td.count != 5) {
                        return nil
                    }
                    
                    let rank = try td[0].text()
                    let name = try td[1].select("a").text()
                    let points = try td[2].text()
                    let numAchieved = try td[3].text()
                    let lastActive = try td[4].text()
                    return UserRow(rank: Int(rank), name: name, points: Int(points) ?? 0, numAchieved: Int(numAchieved) ?? 0, lastActive: lastActive)
                } else {
                    
                    if (td.count != 4) {
                        return nil
                    }
                    
                    let name = try td[0].select("a").text()
                    let points = try td[1].text()
                    let numAchieved = try td[2].text()
                    let lastActive = try td[3].text()
                    return UserRow(name: name, points: Int(points) ?? 0, numAchieved: Int(numAchieved) ?? 0, lastActive: lastActive)
                }

            })
            
            return rows
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        return nil
    }
    
    static func getUserRows(userType: UserType = .registered, sortBy:Int = 4, startingPage:Int = 0) -> AnyPublisher<[UserRow],Error> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/userList.php"
        components.queryItems = [URLQueryItem(name: "s", value: String(sortBy)),
                                 URLQueryItem(name: "o", value: String(startingPage * 25)),
                                 URLQueryItem(name: "p", value: String(userType.rawValue))
        ]

        return URLSession.shared
            .dataTaskPublisher(for: components.url!)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .map({ data -> String in
                return String(data: data, encoding: .ascii) ?? ""
            })
            .map({ html -> [UserRow] in
                self.getUserRowsFromHTML(html: html) ?? []
            })
            .eraseToAnyPublisher()
    }
    
}

struct HubGame : Game {
    internal init(gameID: Int = 0, image: URL? = nil, title: String) {
        self.gameID = gameID
        self.image = image
        self.title = title
    }
    
    
    var gameID: Int
    var image:URL?
    var title: String
}

extension RetroParse {
    
    static func getGamesFromHubHTML(html: String) -> [HubGame]? {
        do {
            var rows = try SwiftSoup
                .parse(html)
                .select("div").array().first(where: { $0.hasClass("component gamealts") })?
                .select("table").select("tr").array()
            rows?.removeFirst()
            
            let games = try rows?.compactMap({ tableRow -> HubGame? in
                let gameID = try Int(tableRow.select("a").attr("href").replacingOccurrences(of: "https://retroachievements.org/game/", with: ""))
                let image = try tableRow.select("a").array().first?.select("img").attr("src") ?? ""
                let title = try tableRow.select("a").array().last?.text() ?? ""

                guard let gameID = gameID else { return nil }
                
                return HubGame(gameID: gameID, image: ParseUtil.parse(url: image), title: title)
            })
            
            return games
            
        } catch Exception.Error(_, let message) {
            print(message)
        } catch {
            print("error")
        }
        return nil
    }
    
    static func getGamesFromHub(gameID: Int) -> AnyPublisher<[HubGame],Error> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "retroachievements.org"
        components.path = "/game/\(gameID)"

        return URLSession.shared
            .dataTaskPublisher(for: components.url!)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .map({ data -> String in
                return String(data: data, encoding: .ascii) ?? ""
            })
            .map({ html -> [HubGame] in
                self.getGamesFromHubHTML(html: html) ?? []
            })
            .eraseToAnyPublisher()
    }

}
