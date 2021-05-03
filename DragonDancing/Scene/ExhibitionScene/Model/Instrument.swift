//
//  Instrument.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/28.
//

import SwiftUI

struct Instrument: Exhibition {
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

extension Array where Element == Instrument {
    static let all = [
        Instrument(name: "唢呐",
                   description: "管身由红木制，呈圆锥形，上端装有带苇哨的铜芯\n下端套着一个铜制的碗口，唢呐发音穿透力、感染力强\n多在民间的吹歌会、秧歌会、鼓乐班和地方曲艺、戏曲的伴奏中应用。",
                   nameOffset: CGSize(width: 110, height: -170)),
        Instrument(name: "小镲",
                   description: "响铜制，钵形，镲面较平稍厚，碗顶系以皮条或绳\n，两面为一副。演奏时，双手各持一面，\n互击而发音。常用于民宝。\n常用于节日喜庆、婚丧活动等器乐合奏中。",
                   nameOffset: CGSize(width: 140, height: 150)),
        Instrument(name: "小锣",
                   description: "也属锣的一种，因锣面较小而得名，音色明亮清脆。\n小锣在京戏中也称京小锣，与大锣在京剧中\n随着表演动作的节奏敲击，起衬托和加强的作用，\n有丰富合奏的效果。",
                   nameOffset: CGSize(width: 200, height: -190)),
        Instrument(name: "小鼓",
                   description: "基本与大鼓相同，只是鼓皮为羊皮，不敲的一面\n绷有多条响弦； 鼓棰使用两条硬木棰，棰头较小。\n流行于广西、湖北等省区。音色清晰、明快，\n并伴有沙沙的声音，别具特色。",
                   nameOffset: CGSize(width: 200, height: -170)),
    ]
}
