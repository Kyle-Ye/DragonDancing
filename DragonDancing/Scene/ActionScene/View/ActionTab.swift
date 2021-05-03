//
//  ActionTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

// FIXME: Undone
struct ActionTab: View {
    let actions: [Action]
    @State var selection = 0
    var body: some View {
        VStack {
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack {
                    ForEach(actions, id: \.name) { action in
                        ActionView(action: action)
                            .frame(width: 300)
                            .padding(.horizontal, 100)
                    }
                }
                .padding(.horizontal, 300)
            }
            .coordinateSpace(name: "action_scene")

            DotSlider(number: actions.count, showLine: true, value: $selection)
        }
        .padding(.vertical, 100)
    }
}

struct ActionTab_Previews: PreviewProvider {
    static var previews: some View {
        ActionTab(actions: .all)
    }
}
