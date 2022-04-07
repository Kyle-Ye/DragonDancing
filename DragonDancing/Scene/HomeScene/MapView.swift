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

    var body: some View {
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

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(provinces: .all, selection: .constant(nil))
            .environmentObject(NavigationWorld())
    }
}
