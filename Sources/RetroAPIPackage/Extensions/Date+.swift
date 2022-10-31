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
    
    func string(_ withFormat: String = "dd-MMM-yyyy") -> String {
       
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = withFormat
        let string = dateFormatter.string(from: self)
        
        return string
        
    }
    
}
