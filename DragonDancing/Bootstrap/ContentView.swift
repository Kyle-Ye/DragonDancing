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
//                case 1:
//                    MeetingScene()
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
                case .seal:
                    SealScene()
                }
            }
            VStack {
                HStack {
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110, height: 110)
                        .onTapGesture {
                            world.showMenu.toggle()
                        }
                        .padding(.top, 80)
                        .padding(.leading, 35)
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
    }
}
