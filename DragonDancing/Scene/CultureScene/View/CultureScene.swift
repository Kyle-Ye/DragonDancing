//
//  CultureScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import SwiftUI

struct CultureScene: View {
    let cultures: [Culture] = .all
    @State var pageNumber = 0
    var body: some View {
        HStack {
            VStack {
                TabView(selection: $pageNumber) {
                    HStack {
                        CultureView(culture: cultures[0])
                        CultureView(culture: cultures[1])
                    }
                    .tag(0)
                    HStack {
                        CultureView(culture: cultures[2])
                        CultureView(culture: cultures[3])
                    }
                    .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                DotSlider(number: 2, showLine: false, value: $pageNumber)
            }
            VStack {
                VerticalText(text: "文创周边")
                    .font(.title)
                    .foregroundColor(.titleText)
                Spacer()
            }
        }
    }
}

struct CultureScene_Previews: PreviewProvider {
    static var previews: some View {
        CultureScene()
    }
}
