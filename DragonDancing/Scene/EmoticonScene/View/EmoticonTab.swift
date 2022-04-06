//
//  EmoticonTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct EmoticonTab: View {
    @EnvironmentObject var world: NavigationWorld

    let emoticons: [Emoticon]
    @State var selection = 0

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 113) {
                Text(emoticons[selection].name)
                    .font(Font.custom("nansongshuju", size: 40))
                    .foregroundColor(.titleText)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 13)
                            .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                    )
                    .padding()
                Text(emoticons[selection].description)
                    .font(Font.custom("nansongshuju", size: 30))
                    .foregroundColor(.bodyText)
                    .frame(width: 250)
                    .padding(.leading, world.showMenu ? 100 : 180)
            }
            .padding(.leading, 50)
            Spacer()
            VStack(alignment: .center) {
                TabView(selection: $selection) {
                    ForEach(emoticons.indices, id:\.self) { index in
                        Image(emoticons[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                DotSlider(number: emoticons.count, showLine: false, value: $selection)
            }
            .frame(minWidth: 350, alignment: .center)

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
