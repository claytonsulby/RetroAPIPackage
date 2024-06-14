//
//  SearchResult.swift
//  JSFun
//
//  Created by Clayton Sulby on 4/7/21.
//

import Foundation

public struct SearchResult : Equatable, Identifiable {
    internal init(id: UUID = UUID(), type: SearchType, primary: String? = nil, secondary: String? = nil, tertiary: String? = nil, username: String? = nil, image: String? = nil) {
        self.id = id
        self.type = type
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.username = username
        self.image = image
    }
    
    
    public var id = UUID()
    var type:SearchType
    var primary:String?
    var secondary:String?
    var tertiary:String?
    var username:String?
    var image:String?
    
    public static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        return lhs.id == rhs.id &&
            lhs.type == rhs.type &&
            lhs.primary == rhs.primary &&
            lhs.secondary == rhs.secondary &&
            lhs.tertiary == rhs.tertiary &&
            lhs.username == rhs.username &&
            lhs.image == rhs.image
    }

}
