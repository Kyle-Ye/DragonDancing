//
//  Action.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import Foundation

struct Action {
    let name: String
    
    var imageName: String {
        "\(name)01"
    }

    var videoName: String {
        name
    }
}

extension Array where Element == Action {
    static let all = [
        Action(name: "踩大球"),
        Action(name: "玩绣球"),
        Action(name: "上高桌"),
        Action(name: "跳高台"),
        Action(name: "梅花桩"),
    ]
}
