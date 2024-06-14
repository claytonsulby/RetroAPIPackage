//
//  File.swift
//  
//
//  Created by Clayton Sulby on 3/10/24.
//

import Foundation

public struct UserRow : Hashable, Identifiable {
    public var id = UUID()
    var image:String {
        "https://retroachievements.org" + "/UserPic/" + name + ".png"
    }
    var rank:Int?
    var name:String
    var points:Int
    var numAchieved:Int
    var lastActive:String
}
