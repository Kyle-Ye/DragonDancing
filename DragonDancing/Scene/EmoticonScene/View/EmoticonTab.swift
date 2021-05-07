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
        HStack(alignment: .top, spacing: 50) {
            VStack(alignment: .leading, spacing: 113) {
                Text(emoticons[selection].name)
                    .font(.largeTitle)
                    .foregroundColor(.titleText)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 13)
                            .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                    )
                    .padding()
                Text(emoticons[selection].description)
                    .foregroundColor(Color("body_text"))
                    .font(.title)
                    .frame(width: 250)
                    .padding(.leading, 100)
            }
            .padding(.leading, 50)
            VStack {
                TabView(selection: $selection) {
                    ForEach(emoticons.indices) { index in
                        Image(emoticons[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(idealWidth: 700)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                DotSlider(number: emoticons.count, showLine: false, value: $selection)
            }
            
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
