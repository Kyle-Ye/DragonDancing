//
//  CultureMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import SwiftUI

struct CultureMenu: View {
    @EnvironmentObject var world: NavigationWorld

    var body: some View {
        VStack {
            Spacer()
            Image("return")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    world.currentTab = .home
                    world.menu = nil
                }
        }
    }
}

struct CultureMenu_Previews: PreviewProvider {
    static var previews: some View {
        CultureMenu()
    }
}
