//
//  Emoticon.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/1.
//

import Foundation

struct Emoticon {
    let name: String
    let description: String
    var imageName: String {
        "表情包_\(name)"
    }
}

extension Array where Element == Emoticon {
    static let all = [
        Emoticon(name: "静",
                 description: "狮子经过千辛万苦,困难重重,身心感到疲倦,便须靜下來休息。（跋山涉水翻山越岭后卧地休息）"),
        Emoticon(name: "惊",
                 description:"狮子遇到危险,便会产生惊怕的动作,舞狮者便须要将其惊怕动作表达给观众。（受到惊吓，表现出害怕的样子）"),
        Emoticon(name: "喜",
                 description: "狮子为了采青,不惜千辛万苦,排除万难,当采得青时,喜形于色。（狮子找到食物时）"),
        Emoticon(name: "哀",
                 description:"狮子遇到困难,未能解決,便会显露哀伤,如何表达,全靠舞狮者。（无力解决困难时流露悲伤情绪）"),
        Emoticon(name: "怒",
                 description: "狮子遇到物体阻挡或外物骚扰,便会愤怒,舞狮者须领会表达。（狮子过桥发现水中自己的倒影）"),
        Emoticon(name: "乐",
                 description:"狮子在樁上自由跳跃,落脚抓水尽显快快乐乐神态。（在“桩”上玩耍、戏水的快乐情绪）"),
        Emoticon(name: "疑",
                 description: "狮子多疑,对身边每一样新的事物,皆产生怀疑,故舞狮者必须做出疑虑神态。（狮子进食时犹豫贪婪、疑虑顾忌的表情）"),
        Emoticon(name: "动",
                 description:"狮子好动,喜爱跳跃,舞狮者在樁上跳跃,更能表現其动态。（腾身打滚、摇头晃尾活泼好动的举止）"),

    ]
}
