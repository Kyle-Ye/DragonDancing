//
//  ActionTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SpriteKit
import SwiftUI

struct ActionTab: View {
    let actions: [Action]
    @State var selection = 0
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(actions.indices) { index in
                    ActionView(action: actions[index], showVideo: selection == index)
                        .frame(idealWidth: 500)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            DotSlider(number: actions.count, showLine: false, value: $selection)
        }
        .padding(.vertical, 100)
    }
    
}

struct ActionTab_Previews: PreviewProvider {
    static var previews: some View {
        ActionTab(actions: .all)
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
