//
//  MapView.swift
//  DragonDancing
//
//  Created by KyleYe on 2022/4/7.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var world: NavigationWorld
    let provinces: [Province]
    @Binding var selection: City?

    @ViewBuilder
    private func mapImage() -> some View {
        Image("地图")
            .resizable()
            .aspectRatio(contentMode: .fit)
//        Image("房子集合")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
    }

    @ViewBuilder
    private func cityView(city: City) -> some View {
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
                .opacity(selection == city ? 1.0 : 0.1)
            )
            .position(x: CGFloat(city.x + 10), y: CGFloat(city.y + 30))
            .opacity(selection == city ? 1.0 : 0.5)
            .animation(.spring(), value: selection)
    }

    var body: some View {
        GeometryReader { proxy in
            mapImage()
                .frame(width: 600)
                .overlay(alignment: .center) {
                    ForEach(provinces, id: \.name) { province in
                        ForEach(province.citys, id: \.name) { city in
                            cityView(city: city)
                        }
                    }
                }

                .scaleEffect(proxy.size.width / 600, anchor: UnitPoint(x: 0, y: 0))
        }
        .padding(.trailing, 200)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(provinces: .all, selection: .constant(nil))
            .environmentObject(NavigationWorld())
            .previewInterfaceOrientation(.landscapeLeft)
            .preview(on: .iPadDevices)
    }
}
