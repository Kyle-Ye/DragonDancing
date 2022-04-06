//
//  OrgansColorView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import SwiftUI

struct OrgansColorView: View {
    @EnvironmentObject var world: NavigationWorld
    @EnvironmentObject var model: OrganWorld
    var body: some View {
        HStack {
            VStack {
                ForEach(model.organs.indices, id: \.self) { index in
                    Image(model.organs[index].name)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 80)
                        .onTapGesture {
                            model.activeIndex = index
                        }
                }
            }
            Divider()
                .padding(.horizontal, world.showMenu ? 0 : 10)
            VStack {
                ForEach(model.organs.indices, id: \.self) { index in
                    HStack(spacing: 10) {
                        ForEach(model.colors, id: \.self) { color in
                            color.clipShape(Circle())
                                .frame(height: 80)
                                .frame(maxWidth: 36)
                                .onTapGesture {
                                    model.organs[index].color = color
                                }
                        }
                        ColorPicker(selection: $model.organs[model.activeIndex].color) {
                            EmptyView()
                        }
                    }
                    .opacity(index == model.activeIndex ? 1 : 0)
                }
            }
            .padding(.leading, 10)
        }
        .frame(height: 600)
    }
}

struct OrgansColorView_Previews: PreviewProvider {
    static var previews: some View {
        OrgansColorView()
            .environmentObject(DIYWorld())
            .environmentObject(NavigationWorld())
    }
}
