//
//  ExhibitionView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct ExhibitionView: View {
    @EnvironmentObject var exhibitionWorld: ExhibitionWolrd

    let exhibition: Exhibition

    var body: some View {
        Image(exhibition.lineImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                VerticalText(text: exhibition.name)
                    .font(.title2.bold())
                    .foregroundColor(.titleText)
                    .offset(exhibition.nameOffset),
                alignment: .center)
            .customScaleEffect(in: .named("tab")){
                Image(exhibition.colorImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .onTapGesture {
                exhibitionWorld.exhibitionDetail = exhibition
            }
            .animation(.spring())
    }
}

struct ExhibitionView_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionView(exhibition: [Exhibition].instruments.randomElement()!)
            .frame(width: 300)
            .environmentObject(ExhibitionWolrd())
    }
}
