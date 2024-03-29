//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public protocol ImagedAwardedExtendedAchievement: Achievement, ExtendedAchievement, AchievementImage, Awarded {}
public protocol AchievementRowProtocol: Achievement, AchievementImage, Awarded {
    var displayOrder:Int? { get }
}
public protocol ExtendedAchievementRowProtocol : AchievementRowProtocol {
    
    var displayOrder:Int? { get }
    var dateCreated:Date { get }
    var dateModified:Date { get }
    var points:Int { get }
    var title:String { get }
    var numAwarded:Int { get }
    var numAwardedHardcore:Int { get }
    var trueRatio:Double { get }
    var dateAwarded:Date? { get }
    var dateAwardedHardcore:Date? { get }
    
    
}
public protocol FeaturableAchievement: Achievement, ExtendedAchievement, AchievementImage, Awarded, FromSet {}

public protocol Achievement {
    
    var achievementID:Int { get }
    var title:String { get }
    var achievementDescription:String { get }
    var points:Int { get }
    
    //public var achievementID: String?
    //public var title: String?
    //public var achievementDescription: String?
    //public var points: String?
}

public protocol ExtendedAchievement {
    
    var trueRatio:Double { get }
    var author:String { get }
    var dateModified:Date { get }
    var dateCreated:Date { get }
    
    //var trueRatio: String?
    //var author: String?
    //var dateModified: String?
    //var dateCreated: String?
}

public protocol AchievementImage {
    
    var imageURL:URL? { get }
    
    //public var badgeName: String?
}

public protocol FromSet {
    
    var displayOrder:Int { get }
    var memAddr:String { get }
    var numAwarded:Int { get }
    var numAwardedHardcore:Int { get }
    
    //public var displayOrder: String?
    //public var memAddr: String?
    //public var numAwarded: String?
    //public var numAwardedHardcore: String?
}

public protocol Awarded {
    
    var points:Int { get }
    
    var dateAwarded:Date? { get }
    var dateAwardedHardcore:Date? { get }
    
    var isAwarded:Bool { get }
    var isAwardedHardcore:Bool { get }
    
    /// From UserSumary
    //           isAwarded: String?
    //public var dateAwarded,
    //           hardcoreAchieved: String?
    
    ///From GameInfoAndUserProgress
    //           dateEarned: String?
    //           dateEarnedHardcore
}





// MARK: - GameExtended

///Achievement
//public var achievementID: String?
//public var title: String?
//public var achievementDescription: String?
//public var points: String?

///Extended
//public var trueRatio: String?
//public var author: String?
//public var dateModified: String?
//public var dateCreated: String?

///Image
//public var badgeName: String?

///FromSet
//public var displayOrder: String?
//public var memAddr: String?
//public var numAwarded: String?
//public var numAwardedHardcore: String?


// MARK: - UserSummary

///Achievement
//public var achievementID,
//           title: String?
//public var achievementDescription,
//           points,

///Game
//           gameID,
//           gameTitle,

///Image
//           badgeName,

///Awarded
//           isAwarded: String?
//public var dateAwarded,
//           hardcoreAchieved: String?


// MARK: - GameInfoAndUserProgress

///Achievement
//public var achievementID,
//           title: String?
//public var achievementDescription,
//           points,

///Extended
//           trueRatio: String?
//public var author: String?
//public var dateModified,
//           dateCreated,

///Image
//           badgeName,

///FromSet
//           displayOrder: String?
//public var memAddr,
//           numAwarded,
//           numAwardedHardcore,

///Awarded
//           dateEarned: String?
//           dateEarnedHardcore


// MARK: - AchievementUnlocks

///Achievement
//public var achievementID,
//           title,
//           achievementDescription,
//           points: String?

///Extended
//public var trueRatio,
//           author,
//           dateCreated,
//           dateModified: String?

// MARK: - AchievementOfTheWeek

///Achievement
//var id,
//    title,
//    achievementDescription,
//    points: String?

///Extended
//var trueRatio,
//    author,
//    dateCreated,
//    dateModified: String?
