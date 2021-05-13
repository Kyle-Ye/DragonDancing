//
//  LionDetailView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import SwiftUI

struct LionDetailView: View {
    @EnvironmentObject var exhibitionWorld: ExhibitionWolrd
    @State var showColor = false
    @State var style = ""
    let lion: Lion
    var body: some View {
        HStack {
            ZStack {
                if style.isEmpty {
                    Image(lion.lineImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                } else {
                    Image(lion.styleImageName(style))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .animation(.spring())
            .frame(idealWidth: 500, alignment: .center)
            .padding(50)
            .overlay(
                VStack {
                    if lion.name == "北狮" {
                        Image("color_toggle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .onTapGesture {
                                if style.isEmpty {
                                    style = "1"
                                } else {
                                    style = ""
                                }
                            }
                    } else {
                        Color.yellow
                            .frame(width: 30)
                            .clipShape(Circle())
                            .onTapGesture {
                                showColor.toggle()
                                style = "1"
                            }
                        Color.red
                            .frame(width: 30)
                            .clipShape(Circle())
                            .onTapGesture {
                                showColor.toggle()
                                style = "2"
                            }
                        Color.black
                            .frame(width: 30)
                            .clipShape(Circle())
                            .onTapGesture {
                                showColor.toggle()
                                style = "3"
                            }
                        Color.gray
                            .frame(width: 30)
                            .clipShape(Circle())
                            .onTapGesture {
                                showColor.toggle()
                                style = ""
                            }
                    }
                },
                alignment: .bottomTrailing
            )

            HStack(alignment: .top) {
                VerticalText(text: lion.name)
                    .font(Font.custom("nansongshuju", size: 25).bold())
                    .foregroundColor(.titleText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                    )
                    .padding(.horizontal, 50)
                VerticalText(text: lion.description)
                    .font(Font.custom("nansongshuju", size: 20))
                    .padding(.top, 80)
                    .padding(.trailing, 100)
            }
        }
    }
}

struct LionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LionDetailView(lion: [Lion].all.randomElement()!)
    }
}
