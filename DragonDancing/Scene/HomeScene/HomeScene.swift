//
//  HomeScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

struct HomeScene: View {
    @EnvironmentObject var world: NavigationWorld
    let provinces = [Province].all
    @State var selection: City?
    var body: some View {
        mapView()
            .overlay(alignment: .trailing) {
                HStack(alignment: .bottom, spacing: 0) {
                    Spacer()
                    HStack(spacing: 80) {
                        Label(
                            title: { Text("文创").font(Font.custom("nansongshuju", size: 20)) },
                            icon: {
                                Image("文创")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .onTapGesture {
                                        world.currentTab = .culture
                                    }
                            }
                        )
                        Label(
                            title: { Text("DIY").font(Font.custom("nansongshuju", size: 20)) },
                            icon: {
                                Image("DIY总开关")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80)
                                    .onTapGesture {
                                        world.currentTab = .diy
                                    }
                            }
                        )
                    }
                    .labelStyle(VerticalLabelStyle())
                    TimeLine(selection: $selection)
                        .padding(.vertical, 50)
                }
            }
    }

    @ViewBuilder
    func mapView() -> some View {
        GeometryReader { proxy in
            ZStack {
                Image("地图")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 600)

                //                Image("房子集合")
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fit)
                //                    .frame(width: 600)
                ForEach(provinces, id: \.name) { province in
                    ForEach(province.citys, id: \.name) { city in
                        Image(city.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            .overlay(
                                ZStack {
                                    Image("city_back")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50)
                                    Text(city.name)
                                        .frame(width: 15)
                                        .font(Font.custom("nansongshuju", size: 10))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                }
                                .zIndex(1)
                                .offset(x: -30, y: -30)
                            )
                            .position(x: CGFloat(city.x + 10), y: CGFloat(city.y + 240))
                            .opacity(selection == city ? 1.0 : 0.0)
                            .animation(.spring(), value: selection)
                    }
                }
            }
            .scaleEffect(proxy.size.width / 600, anchor: UnitPoint(x: 0, y: 0.5))
        }
        .padding(.trailing, 400)
    }
}

struct TimeLine: View {
    @Binding var selection: City?
    let provinces = [Province].all
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .trailing) {
                ForEach(provinces, id: \.name) { province in
                    Text(province.name)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 15)
                        .border(Color.accentColor, width: 4)
                        .background(Color.background)
                        .offset(x: 30)
                    ForEach(province.citys, id: \.name) { city in
                        VStack {
                            GeometryReader { geometry in
                                HStack {
                                    if scaleFactor(in: geometry) > 0.8 {
                                        VStack(alignment: .leading) {
                                            Text(province.name)
                                                .font(Font.custom("nansongshuju", size: 30))
                                            Text(city.description)
                                                .font(Font.custom("nansongshuju", size: 20))
                                        }
                                        .frame(width: 200)
                                        .padding(20)
                                        .border(Color.accentColor, width: 2)
                                        .onAppear {
                                            selection = city
                                        }
                                    }
                                    VStack {
                                        Image(city.name)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100)
                                        Text(city.name)
                                    }
                                    Rectangle()
                                        .foregroundColor(.accentColor)
                                        .frame(width: 50, height: 3)
                                }
                                .opacity(scaleFactor(in: geometry))
                                .animation(.spring())
                                .frame(width: geometry.frame(in: .global).width, height: geometry.frame(in: .global).height, alignment: .trailing)
//                                .overlay(
//                                    VStack {
//                                        Text("factor is \(scaleFactor(in: geometry))")
//                                        Text("center : \(UIScreen.main.bounds.midY)")
//                                        Text("frame in global: \(geometry.frame(in: .global).midY)")
//                                    }
//                                )
                            }
                            .frame(minHeight: 300)
                        }
                    }
                }
            }
            .background(Color.accentColor.frame(width: 2), alignment: .trailing)
            .padding(.horizontal, 50)
            .padding(.vertical, 300)
        }
    }

    private func scaleFactor(in geometry: GeometryProxy) -> Double {
        let global = geometry.frame(in: .global).midY
        let center = UIScreen.main.bounds.midY
        let offset = global - center

        var factor = Double(exp(-abs(offset / 300)))
        // transform factor from 0 - 1 to min - max
        let maxScale = 1.0, minScale = 0.3
        factor = factor * (maxScale - minScale) / (1 - 0) + minScale
        return factor
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
            .environmentObject(NavigationWorld())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}

struct VerticalLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .font(.title)
        }
    }
}
