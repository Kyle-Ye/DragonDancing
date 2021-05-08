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

    var body: some View {
        Group {
            switch model.currentTab {
            case 0:
                OrganTab()
            case 1:
                SealTab()
            default:
                OrganTab()
            }
        }
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
