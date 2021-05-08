//
//  DIYMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import SwiftUI

struct DIYMenu: View {
    @EnvironmentObject var world: NavigationWorld
    @EnvironmentObject var model: DIYWorld
    @State var showShareSheet = false
    var body: some View {
        VStack {
            Image("DIY狮头\(model.currentTab == 0 ? "2" : "")")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    model.currentTab = 0
                }
            Spacer()
            Image("印章\(model.currentTab == 1 ? "2" : "")")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    model.currentTab = 1
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

struct DIYMenu_Previews: PreviewProvider {
    static var previews: some View {
        DIYMenu()
            .previewLayout(.sizeThatFits)
    }
}
