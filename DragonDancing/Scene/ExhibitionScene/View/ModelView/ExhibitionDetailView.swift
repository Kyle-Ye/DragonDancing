//
//  ExhibitionDetailView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct ExhibitionDetailView: View {
    @EnvironmentObject var exhibitionWorld: ExhibitionWolrd
    @State var showColor = false
    let exhibition: Exhibition
    var body: some View {
        HStack {
            ZStack {
                Image(exhibition.lineImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if showColor {
                    Image(exhibition.colorImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .animation(.spring())
            .frame(idealWidth: 500, alignment: .center)
            .padding(50)
            .overlay(
                Image("color_toggle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90, height: 90)
                    .onTapGesture {
                        showColor.toggle()
                    },
                alignment: .bottomTrailing
            )

            HStack(alignment: .top) {
                VerticalText(text: exhibition.name)
                    .font(.title2.bold())
                    .foregroundColor(.titleText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                    )
                    .padding(.horizontal, 50)
                VerticalText(text: exhibition.description)
                    .padding(.top, 80)
                    .padding(.trailing, 100)
            }
        }
    }
}

struct ExhibitionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionDetailView(exhibition: [Exhibition].instruments.randomElement()!)
            .environmentObject(ExhibitionWolrd())
    }
}
