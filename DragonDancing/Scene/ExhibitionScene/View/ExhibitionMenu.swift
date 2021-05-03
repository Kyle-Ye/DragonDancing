//
//  ExhibitionMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct ExhibitionMenu: View {
    @EnvironmentObject var world: NavigationWorld
    @EnvironmentObject var exhibitionWorld: ExhibitionWolrd
    var body: some View {
        VStack {
            Image("instrument_tab")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    exhibitionWorld.currentTab = 0
                }
            Spacer()
            Image("tool_tab")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    exhibitionWorld.currentTab = 1
                }
            Spacer()
            Image("lion_tab")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    exhibitionWorld.currentTab = 2
                }
            Spacer()
            Image("return")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    world.menu = nil
                    world.currentTab = .home
                }
        }
    }
}

struct ExhibitionMenu_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionMenu()
            .environmentObject(ExhibitionWolrd())
            .previewLayout(.sizeThatFits)
    }
}
