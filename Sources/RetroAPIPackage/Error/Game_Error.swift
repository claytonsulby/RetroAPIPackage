//
//  File.swift
//  
//
//  Created by Clayton Sulby on 11/1/22.
//

import Foundation

// MARK: - Welcome
struct Game_Error: Codable {
    let gameTitle: String
    let consoleID, console, forumTopicID: JSONNull?

    enum CodingKeys: String, CodingKey {
        case gameTitle = "GameTitle"
        case consoleID = "ConsoleID"
        case console = "Console"
        case forumTopicID = "ForumTopicID"
    }
}
