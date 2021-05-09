//
//  City.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import Foundation

struct City {
    let name: String
    let description: String
    let x: Double
    let y: Double
}

extension City: Equatable{
    static func == (lhs: City, rhs: City) -> Bool {
        return lhs.name == rhs.name
    }
}
