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
                ZStack {
                    ForEach(organs, id: \.name) { organ in
                        Image("\(organ.name)_\(organ.style)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(organ.color)
                    }
                }
                Image(currentOrgan.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                DotSlider(number: 5, showLine: false, value: .constant(3))
                    .padding()
            }
            .padding(.leading, 100)
            VStack {
                Spacer()
                Image("reset")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            HStack {
                VStack {
                    ForEach(organs, id: \.name) { organ in
                        Image(organ.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 100)
                            .onTapGesture {
//                            currentOrgan = organ
                            }
                    }
                }
                Divider()
                VStack {
                    ForEach(organs, id: \.name) { organ in
                        HStack(spacing: 30) {
                            Color.yellow.clipShape(Circle())
                                .frame(width: 36, height: 100)
                            Color.red.clipShape(Circle())
                                .frame(width: 36, height: 100)
                            Color.blue.clipShape(Circle())
                                .frame(width: 36, height: 100)
                            Color.pink.clipShape(Circle())
                                .frame(width: 36, height: 100)
                            Color.green.clipShape(Circle())
                                .frame(width: 36, height: 100)
                            ColorPicker("", selection: $currentOrgan.color)
                        }
                    }
                }
            }
            .frame(height: 600)
        }
        .onAppear {
            world.menu = AnyView(DIYMenu())
        }
    }
}

struct DIYScene_Previews: PreviewProvider {
    static var previews: some View {
        DIYScene()
            .environmentObject(NavigationWorld())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
