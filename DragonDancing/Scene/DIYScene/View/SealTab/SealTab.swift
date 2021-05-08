//
//  SealTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/8.
//

import SwiftUI

struct SealTab: View {
    @EnvironmentObject var model: DIYWorld

    var body: some View {
        HStack {
            VStack {
                Text("Hello, World!")
                    .border(Color.accentColor, width: 6)
                ForEach(model.backgroundSeals, id: \.self) { seal in
                    Image(seal)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                }
            }
        }
    }
}

struct SealTab_Previews: PreviewProvider {
    static var previews: some View {
        SealTab()
            .environmentObject(DIYWorld())
    }
}
