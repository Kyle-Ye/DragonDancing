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
            HStack(spacing: 80) {

                Label(
                    title: { Text("文创") },
                    icon: {
                        Image("文创")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    }
                ).onTapGesture {
                    world.currentTab = .culture
                }
                Label(
                    title: { Text("DIY") },
                    icon: {
                        Image("DIY总开关")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                    }
                ).onTapGesture {
                    world.currentTab = .diy
                }
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

struct VerticalLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .font(.title)
        }
    }
}
