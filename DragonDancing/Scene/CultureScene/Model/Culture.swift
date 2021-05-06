//
//  Culture.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import Foundation

struct Culture {
    let name:String
}

extension Array where Element == Culture{
    static let all = [
        Culture(name: "mouse"),
        Culture(name: "mouse"),
        Culture(name: "mouse"),
        Culture(name: "mouse"),        
    ]
}
