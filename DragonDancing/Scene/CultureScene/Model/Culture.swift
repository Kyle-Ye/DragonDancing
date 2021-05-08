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
        Culture(name: "道具"),
        Culture(name: "日历"),
        Culture(name: "红白扇子"),
        Culture(name: "表情包贴图"),        
    ]
}
