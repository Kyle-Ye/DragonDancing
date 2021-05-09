//
//  MeetingScene.swift
//  Demo
//
//  Created by Kyle on 2021/5/8.
//

import SpriteKit
import SwiftUI

struct MeetingScene: View {
    @StateObject var world = MeetingWorld()
    var body: some View {
        SpriteView(scene: GameScene.loading)
            .ignoresSafeArea()
            .overlay(
                HStack {
                    Image("bag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .offset(y: -7)
                    Text("\(world.collectedObjects.count) / 9")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                },
                alignment: .top
            )
            .onAppear{
                GameScene.world = world
            }
    }
}

struct MeetingScene_Previews: PreviewProvider {
    static var previews: some View {
        MeetingScene()
    }
}
