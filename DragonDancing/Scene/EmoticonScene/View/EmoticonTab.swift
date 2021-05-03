//
//  EmoticonTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct EmoticonTab: View {
    let emoticons: [Emoticon]
    @State var selection = 0

    var body: some View {
//        ScrollView(.horizontal,
//                   showsIndicators: false) {
//            HStack {
//                ForEach(emoticons, id: \.name) { emoticon in
//                    EmoticonView(emoticon: emoticon)
//                        .frame(width: 700)
//                        .padding()
//                }
//            }
//        }
//        .coordinateSpace(name: "emoticon_tab")

        VStack {
            TabView(selection: $selection) {
                ForEach(emoticons.indices) { index in
                    EmoticonDetailView(emoticon: emoticons[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            DotSlider(number: emoticons.count, showLine: false, value: $selection)
        }
        .padding(.vertical, 100)
    }
}

struct EmoticonTab_Previews: PreviewProvider {
    static var previews: some View {
        EmoticonTab(emoticons: .all)
            .previewLayout(.fixed(width: 3000, height: 1024))
    }
}
