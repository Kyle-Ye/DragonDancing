//
//  HomeScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

struct HomeScene: View {
    @EnvironmentObject var world: NavigationWorld

    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Spacer()
                TimeLine()
            }
        }.overlay(
            HStack {
                Label("文创", systemImage: "pencil.circle")
                Label("DIY", systemImage: "pencil.circle")
                    .onTapGesture {
                        world.showMenu = false
                        world.currentTab = .diy
                    }
                Label("分享", systemImage: "pencil.circle")
            }.labelStyle(VerticalLabelStyle()),
            alignment: .bottomTrailing
        )
    }
}

struct TimeLine: View {
    var body: some View {
        VStack {
            Text("北市")
            Text("南市")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}
