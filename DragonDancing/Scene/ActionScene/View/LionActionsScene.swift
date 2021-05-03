//
//  LineActionsScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct LineActionsScene: View {
    @State var selection: Int = 0
    var lionActions: [Action]

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            HStack {
//                NavigationMenu()
                VStack(spacing: 80) {
                    TabView(selection: $selection) {
                        ForEach(lionActions.indices) { index in
                            LionActionView(
                                lionAction: lionActions[index],
                                showGIF: index == selection
                            ).tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    DotSlider(number: lionActions.count, value: $selection)
                }
                .padding(.bottom, 100)
            }
        }
    }
}

struct LongscrollScene_Previews: PreviewProvider {
    static var previews: some View {
        LineActionsScene(lionActions: .all)
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
