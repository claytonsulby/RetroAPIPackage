//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/19/21.
//

import Foundation

public enum RertoAPIError: Error {
    case gameIDNotRecognized
    case gameIDTooLarge
    
    public var description: String {
        switch self {
        case .gameIDNotRecognized:
            return "The gameID you have provided is either not numeric or the game does not exist."
        case .gameIDTooLarge:
            return "The gameID you have provided is numeric but is too large."
        }
    }
    
}
