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
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    model.showShareSheet.toggle()
                }
            Spacer()
            Image(systemName: "arrow.counterclockwise.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    model.organs = .all
                    model.activeIndex = 0
                }
            Spacer()
            Image("return")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 55, height: 55)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    world.currentTab = .home
                    world.menu = nil
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
