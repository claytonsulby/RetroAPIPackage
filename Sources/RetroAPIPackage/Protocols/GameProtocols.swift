//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public protocol Game {
    
    var gameID:Int? { get }
    var title:String { get }
    
    //everything else
    //public var id,
    //           title: String?
    
    //game info
    //self.title = title
}

public protocol Console {
    
    var consoleID:Int? { get }
    var consoleName:String { get }
    
    //everything else
    //self.consoleID = consoleID
    //self.consoleName = consoleName
    
    //completed game
    //           consoleName,
}

public protocol GameExtended {
    
    var forumTopicID:Int { get }
    var flags:Int { get }
    var imageIconURL:URL { get }
    var imageTitleURL:URL { get }
    var imageInGameURL:URL { get }
    var imageBoxArtURL:URL { get }
    var publisher:String { get }
    var developer:String { get }
    var genre:String { get }
    
    /// - remark: This field is a String and not a Date. The released dates are often not formatted in a way in which they can be parsed into a Date easily.
    var releaseDate:String { get }
    
    //self.forumTopicID = forumTopicID
    //self.flags = flags
    //self.imageIcon = imageIcon
    //self.imageTitle = imageTitle
    //self.imageInGame = imageInGame
    //self.imageBoxArt = imageBoxArt
    //self.publisher = publisher
    //self.developer = developer
    //self.genre = genre
    //self.released = released
}

public protocol AchievementSet {
    
    var isFinal:Bool { get }
    var richPresencePatch:String { get }
    var numAchievements:Int { get }
    var numDistinctPlayers:Int { get }
    var numDistinctPlayersHardcore:Int { get }

    //self.isFinal = isFinal
    //self.richPresencePatch = richPresencePatch
    //self.numAchievements = numAchievements
    //self.numDistinctPlayersCasual = numDistinctPlayersCasual
    //self.numDistinctPlayersHardcore = numDistinctPlayersHardcore
    //self.achievements = achievements
}

public protocol HasAchievements {
    var achievements:Dictionary<String,Achievement> { get }
}

public protocol HasAchievementProgress {
    var achievements:Dictionary<String,ImagedAwardedExtendedAchievementFromSet> { get }
}

public protocol GameImage {
    
    var imageIconURL:URL { get }
    //self.imageIcon = imageIcon
}

public protocol GameProgress {
    
    ///Percentage of achievements awarded to user
    var userCompletionPercentage:Double? { get }
    
    ///Percentage of achievements awarded to user in hardcore mode
    var userCompletionHardcorePercentage:Double? { get }
    
    var possibleScore:Int? { get }
    var awardedScore:Int? { get }
    
    var numAwardedAchievements:Int { get }
    var numPossibleAchievements:Int? { get }
    
    ///Boolean for completed game entry if the game is in hardcore mode
    var hardcoreModeEnabled:Bool? { get }
    
    //gameinfoanduserprogress
    //self.numAwardedToUser = numAwardedToUser
    //self.numAwardedToUserHardcore = numAwardedToUserHardcore
    //self.userCompletion = userCompletion
    //self.userCompletionHardcore = userCompletionHardcore
    
//    "NumAchievements":52
//    "NumAwardedToUser":3,
//    "NumAwardedToUserHardcore":0,
//    "UserCompletion":"5.77%",
//    "UserCompletionHardcore":"0.00%"}
    
    //completedgame
    //public var numAwarded,
    //           maxPossible,
    //           pctWon,
    //           hardcoreMode: String?
    
//    "NumAwarded":"3",
//    "MaxPossible":"52",
//    "PctWon":"0.0577",
//    "HardcoreMode":"0"}
    
    //recent game
    //public var numPossibleAchievements,
    //           possibleScore,
    //           numAchieved,
    //           scoreAchieved: PHPHelper.JSONPrimitiveType?
    
//    "NumPossibleAchievements":"52",
//    "PossibleScore":"487",
//    "NumAchieved":"3",
//    "ScoreAchieved":"8"}
    
}

public protocol RecentlyPlayed {
    
    var lastPlayed:Date { get }
    var userSubmittedRating:Int? { get }
    
    //self.lastPlayed = lastPlayed
    //self.myVote = myVote
    
}

// MARK: - AchievementOfTheWeek

///Game
//public var id,
//           title: String?

// MARK: - AchievementUnlocks

///Game
//public var gameID,
//           title: String?

// MARK: - GameInfo

///Game
//self.title = title

///Console
//self.consoleID = consoleID
//self.consoleName = consoleName

///Extended
//self.forumTopicID = forumTopicID
//self.flags = flags
//self.imageIcon = imageIcon
//self.imageTitle = imageTitle
//self.imageInGame = imageInGame
//self.imageBoxArt = imageBoxArt
//self.publisher = publisher
//self.developer = developer
//self.genre = genre
//self.released = released

///unused
//self.gameIcon = gameIcon
//self.console = console
//self.gameTitle = gameTitle

// MARK: - GameExtended

///Game
//self.gameID = gameID
//self.title = title

///Console
//self.consoleID = consoleID
//self.consoleName = consoleName

///Extended
//self.forumTopicID = forumTopicID
//self.flags = flags
//self.imageTitle = imageTitle
//self.imageInGame = imageInGame
//self.imageBoxArt = imageBoxArt
//self.publisher = publisher
//self.developer = developer
//self.genre = genre
//self.released = released

///HasAchievements
//self.isFinal = isFinal
//self.richPresencePatch = richPresencePatch
//self.numAchievements = numAchievements
//self.numDistinctPlayersCasual = numDistinctPlayersCasual
//self.numDistinctPlayersHardcore = numDistinctPlayersHardcore
//self.achievements = achievements

///Image
//self.imageIcon = imageIcon

// MARK: - GameInfoAndUserProgress

///Game
//self.gameID = id
//self.title = title

///Console
//self.consoleID = consoleID
//self.consoleName = consoleName

///Extended
//self.forumTopicID = forumTopicID
//self.flags = flags
//self.imageTitle = imageTitle
//self.imageIngame = imageIngame
//self.imageBoxArt = imageBoxArt
//self.publisher = publisher
//self.developer = developer
//self.genre = genre
//self.released = released

///HasAchievements
//self.isFinal = isFinal
//self.richPresencePatch = richPresencePatch
//self.numAchievements = numAchievements
//self.numDistinctPlayersCasual = numDistinctPlayersCasual
//self.numDistinctPlayersHardcore = numDistinctPlayersHardcore
//self.achievements = achievements

///Progress
//self.numAwardedToUser = numAwardedToUser
//self.numAwardedToUserHardcore = numAwardedToUserHardcore
//self.userCompletion = userCompletion
//self.userCompletionHardcore = userCompletionHardcore

///Image
//self.imageIcon = imageIcon

// MARK: - GameList

///Game
//public var title,
//           id,

///Image
//           imageIcon,

///Console
//           consoleID,
//           consoleName: String?

// MARK: - CompletedGames

///Game
//public var gameID,
//           title: String?


///Image
//           imageIcon,

///Console
//           consoleName,

///Progress
//public var numAwarded,
//           maxPossible,
//           pctWon,
//           hardcoreMode: String?

// MARK: - RecentGame

///Game
//public var gameID,
//           title: String?

///Console
//           consoleID,
//           consoleName,

///Image
//public var imageIcon,

///RecentlyPlayed
//           lastPlayed: String?
//public var myVote: String?

///Progress
//public var numPossibleAchievements,
//           possibleScore,
//           numAchieved,
//           scoreAchieved: PHPHelper.JSONPrimitiveType?

// MARK: - UserSummary

///Game
//self.gameID = gameID
//self.title = title

///Console
//self.consoleID = consoleID
//self.consoleName = consoleName

///Image
//self.imageIcon = imageIcon

///RecentlyPlayed
//self.lastPlayed = lastPlayed
//self.myVote = myVote

