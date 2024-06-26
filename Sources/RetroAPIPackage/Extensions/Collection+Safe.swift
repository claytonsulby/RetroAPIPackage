//
//  File.swift
//  
//
//  Created by Clayton Sulby on 3/10/24.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    public subscript(safe index: Index) -> Iterator.Element? {
        return (startIndex <= index && index < endIndex) ? self[index] : nil
        
    }
}
