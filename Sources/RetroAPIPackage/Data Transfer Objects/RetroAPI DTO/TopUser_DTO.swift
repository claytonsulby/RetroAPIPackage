//
//  TopUser.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

import Foundation

public typealias TopUsers_DTO = [TopUser_DTO]

extension TopUsers_DTO : DTO {}

public struct TopUser_DTO : DTO, Codable, Equatable {
    
    public init(username: String = "", RAPoints: String = "", trueRAPoints: String = "") {
        self.username = username
        self.RAPoints = RAPoints
        self.trueRAPoints = trueRAPoints
    }
    
    ///string username of player
    public var username:String
    
    ///sum total of points for achievements and games which are still active
    public var RAPoints:String
    
    ///sum total of points for achievements and games which are either active or removed / editted / deleted.
    public var trueRAPoints:String
    
    enum CodingKeys: String, CodingKey {
        case username = "1"
        case RAPoints = "2"
        case trueRAPoints = "3"
    }
    
    public static func == (lhs: TopUser_DTO, rhs: TopUser_DTO) -> Bool {
        return lhs.username == rhs.username &&
            lhs.RAPoints == rhs.RAPoints &&
            lhs.trueRAPoints == rhs.trueRAPoints
    }
}
