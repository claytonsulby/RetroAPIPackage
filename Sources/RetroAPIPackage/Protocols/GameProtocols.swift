//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public protocol GameMetadata : Game, GameExtended, Console, HasAchievements, UserProgress {

}

public protocol Game {
    
    var gameID:Int { get }
    var title:String { get }

}

public protocol Console {
    
    var consoleID:Int { get }
    var consoleName:String { get }

}

public protocol GameExtended : GameIcon {
    
    var forumTopicID:Int? { get }
    var flags:Int { get }
    var imageIconURL:URL? { get }
    var imageTitleURL:URL? { get }
    var imageInGameURL:URL? { get }
    var imageBoxArtURL:URL? { get }
    var publisher:String? { get }
    var developer:String? { get }
    var genre:String? { get }
    
    /// - remark: This field is a String and not a Date. The released dates are often not formatted in a way in which they can be parsed into a Date easily.
    var releaseDate:String? { get }

}

public protocol HasAchievements {
    
    var isFinal:Bool { get }
    var richPresencePatch:String { get }
    var numAchievements:Int? { get }
    var numDistinctPlayers:Int { get }
    var numDistinctPlayersHardcore:Int { get }

}

public protocol GameIcon {
    
    var imageIconURL:URL? { get }

}

public protocol UserProgress {
    
    ///Percentage of achievements awarded to user
    var userCompletion:Double? { get }
    
    ///Percentage of achievements awarded to user in hardcore mode
    var userCompletionHardcore:Double? { get }
    
    var possibleScore:Int? { get }
    var awardedScore:Int? { get }
    
    var numAwardedToUser:Int? { get }
    var numAwardedToUserHardcore:Int? { get }
    var numAchievements:Int? { get }

}

public protocol RecentlyPlayed {
    
    var lastPlayed:Date { get }
    var userSubmittedRating:Int? { get }

}
