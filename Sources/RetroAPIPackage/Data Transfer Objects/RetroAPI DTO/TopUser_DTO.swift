//
//  TopUser.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

import Foundation

public typealias TopUsers_DTO = [TopUser_DTO]

public struct TopUser_DTO : Codable, Equatable {
    public init(user: String, points: String, score: String) {
        self.user = user
        self.points = points
        self.score = score
    }
    
    public var user:String
    public var points:String
    public var score:String
    
    enum CodingKeys: String, CodingKey {
        case user = "1"
        case points = "2"
        case score = "3"
    }
    
    public static func == (lhs: TopUser_DTO, rhs: TopUser_DTO) -> Bool {
        return lhs.user == rhs.user &&
            lhs.points == rhs.points &&
            lhs.score == rhs.score
    }
}
