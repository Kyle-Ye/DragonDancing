//
//  Organ.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import SwiftUI

struct Organ{
    let name:String
    var style:Int
    var color:Color
    
    init(name:String, style:Int = 0) {
        self.name = name
        self.style = style
        self.color = .black
    }
}

extension Array where Element == Organ{
    static let all = [
        Organ(name: "cavity"),
        Organ(name: "eyes"),
        Organ(name: "nose"),
        Organ(name: "mouse"),
        Organ(name: "decoration"),
    ]
}
