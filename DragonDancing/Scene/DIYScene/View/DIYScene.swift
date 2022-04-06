//
//  DIYScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct DIYScene: View {
    @EnvironmentObject var world: NavigationWorld
    @StateObject var model = DIYWorld()
    @StateObject var organ = OrganWorld()
    @StateObject var seal = SealWorld()

    var body: some View {
        Group {
            switch model.currentTab {
            case 0:
                OrganTab()
                    .environmentObject(organ)
            case 1:
                SealTab()
                    .environmentObject(seal)
            default:
                OrganTab()
            }
        }
        .padding(.leading, world.showMenu ? 0 : 100)
        .onAppear {
            world.menu = AnyView(DIYMenu().environmentObject(model))
        }
        .environmentObject(model)
    }
}

struct DIYScene_Previews: PreviewProvider {
    static var previews: some View {
        DIYScene()
            .environmentObject(NavigationWorld())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
