//
//  Tool.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct Tool: Exhibition {
    let name: String
    let description: String
    let nameOffset: CGSize
    var lineImageName: String {
        "\(name)_line"
    }

    var colorImageName: String {
        "\(name)_color"
    }
}

extension Array where Element == Tool {
    static let all = [
        Tool(name: "绣球",
             description: "绣球是用丝织品仿绣球花制作的圆球。\n古代视绣球为吉祥喜庆之品。",
             nameOffset: CGSize(width: 150, height: 150)),
        Tool(name: "高桌",
             description: "传统木质材料，狮子在高台高梯完成表演，做抖动、\n搔样、跌扑、跳跃、踩球、过板、登高等动作。",
             nameOffset: CGSize(width: 200, height: -150)),
        Tool(name: "高椅",
             description: "传统木质材料，狮子在高台高梯完成表演，做抖动、\n搔样、跌扑、跳跃、踩球、过板、登高等动作。",
             nameOffset: CGSize(width: 200, height: -100)),
        Tool(name: "梅花桩",
             description: "“梅花桩舞狮”号称中华武术武林绝技.阵容强大,\n气势磅礴,其低桩1．6米,高桩4米.\n飞桩逾越3.2米。",
             nameOffset: CGSize(width: 150, height: 150)),
    ]
}
