//
//  TopUser.swift
//  JSFun
//
//  Created by Clayton Sulby on 3/28/21.
//

import Foundation

public typealias TopUsers_DTO = [TopUser_DTO]

public struct TopUser_DTO : Hashable, Decodable {
    var user:String
    var points:String
    var score:String
    
    enum CodingKeys: String, CodingKey {
        case user = "1"
        case points = "2"
        case score = "3"
    }
}
