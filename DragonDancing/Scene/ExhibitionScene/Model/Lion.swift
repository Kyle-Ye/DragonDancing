//
//  Lion.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct Lion: Exhibition {
    let name: String
    let description: String
    let styles: [String]
    let nameOffset: CGSize
    var lineImageName: String {
        "\(name)_line"
    }

    var colorImageName: String {
        "\(name)_color1"
    }

    func styleImageName(_ style: String) -> String {
        "\(name)_color\(style)"
    }
}

extension Array where Element == Lion {
    static let all = [
        Lion(name: "北狮",
             description: "北狮的造型酷似真狮，狮头较为简单，\n全身披金黄色毛。狮头上有红结者为雄狮，\n有绿结者为雌性。",
             styles: ["1"],
             nameOffset: CGSize(width: 200, height: 20)),
        Lion(name: "南狮",
             description: "传统上，南狮狮头造型上有“刘备狮”、\n“关公狮”、“张飞狮”之分。三种狮头，不单颜色\n，装饰不同，舞法亦根据三个古人的性格而异。",
             styles: ["1", "2", "3"],
             nameOffset: CGSize(width: 200, height: -20)),
    ]
}
