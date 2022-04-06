//
//  File.swift
//  
//
//  Created by Clayton Sulby on 4/6/22.
//

import Foundation

public protocol DTO {
    init()
}

extension DTO {
    public init() {self.init()}
}

extension Array where Element:DTO {
    init()
}
