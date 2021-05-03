//
//  ExhibitionScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct ExhibitionScene: View {
    @EnvironmentObject var world: NavigationWorld
    @StateObject var exhibitionWorld = ExhibitionWolrd()
    var body: some View {
        ZStack {
            if let exhibitionDetail = exhibitionWorld.exhibitionDetail {
                ExhibitionDetailView(exhibition: exhibitionDetail)
                    .onAppear {
                        world.menu = AnyView(ExhibitionDetailMenu().environmentObject(exhibitionWorld))
                    }
            } else {
                ExhibitionTab(exhibitions: exhibitions(for: exhibitionWorld.currentTab))
                    .overlay(
                        Text(title(for: exhibitionWorld.currentTab))
                            .font(.largeTitle.bold())
                            .foregroundColor(.titleText)
                            .padding(40)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                            )
                            .padding(.vertical, 90)
                            .padding(.leading, world.showMenu ? 100 : 180),
                        alignment: .topLeading
                    )
                    .onAppear {
                        world.menu = AnyView(ExhibitionMenu().environmentObject(exhibitionWorld))
                    }
            }
        }
        .animation(.easeOut)
        .environmentObject(exhibitionWorld)
    }

    private func exhibitions(for tab: Int) -> [Exhibition] {
        switch tab {
        case 0:
            return .instruments
        case 1:
            return .tools
        case 2:
            return .lions
        default:
            return .instruments
        }
    }

    private func title(for tab: Int) -> String {
        switch tab {
        case 0:
            return "乐器陈列室"
        case 1:
            return "道具陈列室"
        case 2:
            return "狮头陈列室"
        default:
            return "乐器陈列室"
        }
    }
}

struct ExhibitionScene_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionScene()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
