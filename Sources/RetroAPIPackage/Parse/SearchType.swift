//
//  SearchType.swift
//  JSFun
//
//  Created by Clayton Sulby on 8/12/21.
//

import Foundation

public enum SearchType : String, CaseIterable {
    case user = "User"
    case game = "Game"
    case achievment = "Achievement"
    case gameComment = "Game Comment"
    case ticketComment = "Ticket Comment"
    case forumComment = "Forum Comment"
    case none
    
    var short:String {
        return String(self.rawValue.first!)
    }
}
