//
//  SealMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import SwiftUI

struct SealMenu: View {
    @EnvironmentObject var world: NavigationWorld

    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "return")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    world.currentTab = .seal
                    world.menu = nil
                }
        }
    }
}

struct SealMenu_Previews: PreviewProvider {
    static var previews: some View {
        SealMenu()
    }
}
