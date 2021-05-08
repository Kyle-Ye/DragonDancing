//
//  CultureScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import SwiftUI

struct CultureScene: View {
    @EnvironmentObject var world: NavigationWorld

    let cultures: [Culture] = .all
    @State private var pageNumber = 0
    var body: some View {
        HStack {
            VStack(spacing: 50) {
                TabView(selection: $pageNumber) {
                    ForEach(0 ..< cultures.count / 2) { index in
                        HStack(spacing: 100) {
                            CultureView(culture: cultures[index * 2])
                            CultureView(culture: cultures[index * 2 + 1])
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                DotSlider(number: cultures.count / 2, showLine: false, value: $pageNumber)
            }
            .padding(.vertical, 150)
            VStack {
                Text("文创周边")
                    .font(.system(size: 60).bold())
                    .foregroundColor(.titleText)
                    .frame(width: 70)
                    .padding(20)
                Spacer()
            }
        }
        .padding(.leading, 150)
        .padding(.trailing, 80)
        .onAppear {
            world.menu = AnyView(CultureMenu())
        }
    }
}

struct CultureScene_Previews: PreviewProvider {
    static var previews: some View {
        CultureScene()
    }
}
