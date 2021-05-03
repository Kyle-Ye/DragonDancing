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
        .padding(.horizontal, 50)
    }

    func mainMenu() -> AnyView {
        AnyView(
            VStack {
                Image("meeting")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .home
                    }
                Spacer()
                Image("action")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .action
                    }
                Spacer()
                Image("emoticon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        world.currentTab = .emotion
                    }
                Spacer()
                Image("exhibition")
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
