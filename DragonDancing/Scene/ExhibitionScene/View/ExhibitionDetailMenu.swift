//
//  ExhibitionDetailMenu.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct ExhibitionDetailMenu: View {
    @EnvironmentObject var exhibitionWorld: ExhibitionWolrd

    var body: some View {
        VStack {
            if let instrument = exhibitionWorld.exhibitionDetail as? Instrument {
                Image("nav_play")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .onTapGesture {
                        print(instrument.name)
                    }
                Spacer()
            }
            Image("return")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .onTapGesture {
                    
                    exhibitionWorld.exhibitionDetail = nil
                }
        }
    }
}

struct ExhibitionDetailMenu_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionDetailMenu()
            .environmentObject(ExhibitionWolrd())
    }
}
