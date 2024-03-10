//
//  File.swift
//  
//
//  Created by Clayton Sulby on 3/8/24.
//

import Foundation

public struct GameCodingKeys {
    static let gameID = "ID"
    static let title = "Title"
    static let consoleID = "ConsoleID"
    static let forumTopicID = "forumTopicID"
    static let flags = "Flags"
    static let imageIcon = "ImageIcon"
    static let imageTitle = "ImageTitle"
    static let imageInGame = "ImageIngame"
    static let imageBoxArt = "ImageBoxArt"
    static let publisher = "Publisher"
    static let developer = "Developer"
    static let genre = "Genre"
    static let releaseDate = "Released"
    static let isFinal = "IsFinal"
    static let consoleName = "ConsoleName"
    static let richPresencePatch = "RichPresencePatch"
    static let numAchievements = "NumAchievements"
    static let numDistinctPlayersCasual = "NumDistinctPlayersCasual"
    static let numDistinctPlayersHardcore = "NumDistinctPlayersHardcore"
    static let achievements = "Achievements"
    static let numAwardedToUser = "NumAwardedToUser"
    static let numAwardedToUserHardcore = "NumAwardedToUserHardcore"
    static let userCompletion = "UserCompletion"
    static let userCompletionHardcore = "UserCompletionHardcore"
}

public class GameTypes {
    public typealias GameID = Int?
    public typealias Title = String
    public typealias ForumTopicID = Int?
    public typealias ConsoleID = Int?
}
