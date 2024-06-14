//
//  File.swift
//  
//
//  Created by Clayton Sulby on 3/10/24.
//

import Foundation

public enum UserType : Int, CaseIterable {
    case unregistered = 0
    case registered = 1
    case superUser = 2
    case developer = 3
    case admin = 4
    
    var info: (code: Int, description: String) {
        switch self {
        case .unregistered:
            return (0, "Unregistered")
        case .registered:
            return (1, "Registered")
        case .superUser:
            return (2, "Super User")
        case .developer:
            return (3, "Developer")
        case .admin:
            return (4, "Admin")
        }
    }
    
    init(from string: String) {
        switch string {
        case "Unregistered":
            self = .unregistered
        case "Registered":
            self = .registered
        case "Super User":
            self = .superUser
        case "Developer":
            self = .developer
        case "Admin":
            self = .admin
        default:
            self = .unregistered
        }
    }
}
