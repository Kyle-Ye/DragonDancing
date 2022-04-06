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
        if let menu = world.menu {
            menu.padding(.vertical, 50)
                .frame(width: 140, alignment: .center)
        } else {
            mainMenu()
        }
    }

    func mainMenu() -> some View {
        VStack {
            icon(name: "房子", tab: .home)
            Spacer()
            icon(name: "action", tab: .action)
            Spacer()
            icon(name: "emoticon", tab: .emotion)
            Spacer()
            icon(name: "exhibition", tab: .exhibition)
        }
        .padding(.vertical, 50)
        .frame(width: 140, alignment: .center)
    }

    private func icon(name: String, tab: SceneTab) -> some View {
        Image("\(name)\(world.currentTab == tab ? "2" : "")")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80, height: 80)
            .onTapGesture {
                world.currentTab = tab
            }
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
