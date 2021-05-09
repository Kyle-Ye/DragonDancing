//
//  OrganTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import SwiftUI

struct OrganTab: View {
    @EnvironmentObject var world: NavigationWorld
    @EnvironmentObject var model: OrganWorld

    var body: some View {
        HStack {
            VStack {
                OrgansView(organs: model.organs)
                Image(model.organs[model.activeIndex].name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                DotSlider(number: 5, showLine: false, value: $model.organs[model.activeIndex].style)
                    .padding()
                    .padding(.bottom, 50)
                HStack(spacing: 100) {
                    Image("分享")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            model.showShareSheet.toggle()
                        }
                    Image("重置")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 55)
                        .foregroundColor(.accentColor)
                        .onTapGesture {
                            model.organs = .all
                            model.activeIndex = 0
                        }
                }
            }
            .padding(.horizontal, world.showMenu ? 0 : 100)
            OrgansColorView()
        }
    }
}

struct OrganTab_Previews: PreviewProvider {
    static var previews: some View {
        OrganTab()
    }
}
