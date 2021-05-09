//
//  NavigationMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct NavigationMenu: View {
    @EnvironmentObject var world: NavigationWorld
    var body: some View {
        VStack {
            world.menu ?? mainMenu()
        }
        .padding(.top, 190)
        .padding(.vertical, 100)
        .padding(.horizontal, 30)
    }

    func mainMenu() -> AnyView {
        AnyView(
            VStack {
                Image("meeting\(world.currentTab == .home ? "2" : "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .home
                    }
                Spacer()
                Image("meeting\(world.currentTab == .meeting ? "2" : "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.showMenu = false
                        world.currentTab = .meeting
                    }
                Spacer()
                Image("action\(world.currentTab == .action ? "2" : "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .action
                    }
                Spacer()
                Image("emoticon\(world.currentTab == .emotion ? "2" : "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .emotion
                    }
                Spacer()
                Image("exhibition\(world.currentTab == .exhibition ? "2" : "")")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .exhibition
                    }
            }
        )
    }
}

struct NavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            NavigationMenu()
            Divider()
            Text("Hello")
        }
        .environmentObject(NavigationWorld())
        .previewLayout(.fixed(width: 300, height: 1024))
    }
}
