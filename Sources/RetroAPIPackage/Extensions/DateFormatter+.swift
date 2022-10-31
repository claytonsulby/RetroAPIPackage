//
//  File.swift
//  
//
//  Created by Clayton Sulby on 8/18/21.
//

import Foundation

public extension DateFormatter {
    
    static func date(format: String = "yyyy-MM-dd HH:mm:ss", fromString date: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: date)
        
        return date
        
    }
}
