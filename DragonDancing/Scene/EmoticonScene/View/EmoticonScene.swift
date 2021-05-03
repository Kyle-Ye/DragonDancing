//
//  EmoticonScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/28.
//

import SwiftUI

struct EmoticonScene: View {
    var body: some View {
        EmoticonTab(emoticons: .all)
    }
}

struct EmoticonScene_Previews: PreviewProvider {
    static var previews: some View {
        EmoticonScene()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
