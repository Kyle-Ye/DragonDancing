//
//  ContentView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

struct ContentView: View {
    @StateObject var world = NavigationWorld()
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            HStack {
                if world.showMenu {
                    NavigationMenu()
                    Divider()
                }
                switch world.currentTab {
                case .home:
                    HomeScene()
                case .meeting:
                    MeetingScene()
                case .action:
                    ActionScene()
                case .emotion:
                    EmoticonScene()
                case .exhibition:
                    ExhibitionScene()
                case .culture:
                    CultureScene()
                case .diy:
                    DIYScene()
                }
            }
            VStack {
                HStack {
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                        .onTapGesture {
                            if world.currentTab != .home {
                                world.showMenu.toggle()
                            }
                        }
                        .padding(.top, 80)
                        .padding(.leading, 15)
                    Spacer()
                }
                Spacer()
            }
        }
        .animation(.spring())
        .environmentObject(world)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
