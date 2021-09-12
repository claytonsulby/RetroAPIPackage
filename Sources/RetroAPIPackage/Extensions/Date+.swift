//
//  File.swift
//  
//
//  Created by Clayton Sulby on 9/12/21.
//

import Foundation

extension Date {
    
    var string:String {
        DateFormatter().string(from: self)
    }
    
}
