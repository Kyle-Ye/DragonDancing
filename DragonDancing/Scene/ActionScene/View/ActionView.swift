//
//  ActionView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct ActionView: View {
    let action: Action
    var showGIF = false
    var body: some View {
        ZStack {
            Image(action.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    VerticalText(text: action.name)
                        .font(.title2.bold())
                        .foregroundColor(.titleText)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                        )
                        .padding()
                    , alignment: .topTrailing
                )
                .customScaleEffect(in: .named("action_scene")) {
                    GIFImage(named: action.gifName)
                        .scaleEffect(0.1
                        )
                }
        }
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView(action: [Action].all.randomElement()!)
    }
}
