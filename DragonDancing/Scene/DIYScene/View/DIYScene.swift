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
        HStack {
            VStack {
                OrgansView(organs: model.organs)
                    .animation(.spring())
                    .contextMenu {
                        Button(action: {
                            model.showShareSheet.toggle()
                        }) {
                            Text("分享")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                    .sheet(isPresented: $model.showShareSheet, content: {
                        ActivityView(image: model.getOrgansImage())
                    })
                Image(model.organs[model.activeIndex].name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                DotSlider(number: 5, showLine: false, value: $model.organs[model.activeIndex].style)
                    .padding()
            }
            .padding(.leading, 100)
            .padding(.trailing, 100)

            HStack {
                VStack {
                    ForEach(model.organs.indices) { index in
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
                    .padding(.horizontal, 30)
                VStack {
                    ForEach(model.organs.indices) { index in
                        HStack(spacing: 30) {
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
                .padding(.leading, 30)
            }
            .frame(height: 600)
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
