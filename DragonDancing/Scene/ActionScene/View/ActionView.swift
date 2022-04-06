//
//  ActionView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import AVKit
import SpriteKit
import SwiftUI

struct ActionView: View {
    let action: Action
    var showVideo = false
    @State var playing = false
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(action.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(alignment: .topTrailing) {
                        Text(action.name)
                            .font(Font.custom("nansongshuju", size: 30).bold())
                            .foregroundColor(.titleText)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 30)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                            )
                            .padding(50)
                    }

                if showVideo && !playing {
                    Button(action: {
                        playing.toggle()
                    }, label: {
                        Image(systemName: "play.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                    })
                }
                if showVideo && playing {
                    SpriteView(scene: ActionVideoScene(name: action.videoName, size: geometry.size))
                }
            }
        }
        .onDisappear {
            playing = false
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView(action: [Action].all.randomElement()!)
    }
}
