//
//  LionActionView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct LionActionView: View {
    var lionAction: Action
    var showGIF = false
    var body: some View {
        ZStack{
            Image(lionAction.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 500)
                .overlay(
                    VerticalText(text: lionAction.name)
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
            if showGIF{
                GIFImage(named: lionAction.gifName)
                    .animation(.easeIn(duration: 5))
            }
        }
    }
}

struct LionActionView_Previews: PreviewProvider {
    static var previews: some View {
        LionActionView(lionAction: .init(name: "玩绣球"))
    }
}
