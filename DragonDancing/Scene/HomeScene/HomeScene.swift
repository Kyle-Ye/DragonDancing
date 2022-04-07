//
//  HomeScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

struct HomeScene: View {
    @EnvironmentObject var world: NavigationWorld
    let provinces = [Province].all
    @State var selection: City?
    var body: some View {
        MapView(provinces: provinces, selection: $selection)
            .overlay(alignment: .trailing) {
                HStack(alignment: .bottom, spacing: 0) {
                    Spacer()
                    HStack(spacing: 80) {
                        Label(
                            title: { Text("文创").font(Font.custom("nansongshuju", size: 20)) },
                            icon: {
                                Image("文创")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .onTapGesture {
                                        world.currentTab = .culture
                                    }
                            }
                        )
                        Label(
                            title: { Text("DIY").font(Font.custom("nansongshuju", size: 20)) },
                            icon: {
                                Image("DIY总开关")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .onTapGesture {
                                        world.currentTab = .diy
                                    }
                            }
                        )
                    }
                    .labelStyle(VerticalLabelStyle())
                    TimeLine(selection: $selection)
                        .padding(.vertical, 50)
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
            .environmentObject(NavigationWorld())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .font(.title)
        }
    }
}
