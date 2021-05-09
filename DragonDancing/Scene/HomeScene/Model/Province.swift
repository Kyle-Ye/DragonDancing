//
//  Province.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import Foundation

struct Province {
    let name: String
    let citys: [City]
}

extension Array where Element == Province {
    static let all = [
        Province(name: "河北", citys: [
            City(name: "徐水", description: "徐水县北里村1925年创建狮子会。素有北狮狮舞之乡的美称。明清时期就以花会的形势在张家庙会逢年过节，重大事件等场合中演出。"),
        ]),
        Province(name: "湖北", citys: [
            City(name: "黄陂", description: "僵狮子是一种流行于这两地一带元宵节的一种民俗活动，是一种舞狮的游狮活动，尤其以黄陂的僵狮子最为有名。"),
        ]),
        Province(name: "浙江", citys: [
            City(name: "新昌", description: "新昌的狮舞资源也极为丰富，爱用“舞狮”这种方式来期盼风调雨顺、平安吉祥的年景。县域内的舞狮队较有名气的有洪塘狮舞和上道地狮舞、下洲狮舞、寨岭黑毛狮子等。"),
        ]),
        Province(name: "湖南", citys: [
            City(name: "长沙", description: "湖南属于我国中部地区，介于舞狮派系的南北分支处，80年代前湖南只有民间北狮表演社团，现湖南各大高校及政府文化部门的保护性培养扶持下，舞狮文化突飞猛进。"),
        ]),
        Province(name: "福建", citys: [
            City(name: "林坊", description: "林坊青狮属北狮武功狮，俗称公狮。1989年林坊林氏成立“林坊武术协会”是连城县最早成立的武术协会。"),
        ]),
        Province(name: "广西", citys: [
            City(name: "田阳", description: "田阳舞狮有着悠久的历史，相传早在1000多年前，在田阳这片古老的土地上就有舞狮活动。"),
        ]),
        Province(name: "广东", citys: [
            City(name: "阳江", description: "江城旧时大凡有喜庆必放炮竹舞狮子，尤其是春节贺岁。大年初一清晨就有狮子拜屋。"),
            City(name: "遂溪", description: "遂溪醒狮表演始于明清时期，是一种地道的广东省民间舞蹈，是广东舞苑中的一种。遂溪的民间醒狮团队已有255个，其中高桩狮28个，地狮227个，表演者过万人。"),
            City(name: "佛山", description: "广东佛山市是狮艺之乡，是南狮的发源地，是首个“中国龙狮龙舟运动名城”。禅城区是“中国龙狮运动之乡”，南海区西樵镇是全国唯一的“中国龙狮名镇”佛山南狮有”狮王之王“之美誉。"),
        ]),
    ]
}
