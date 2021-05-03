//
//  ExhibitionTab.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct ExhibitionTab: View {
    let exhibitions: [Exhibition]
    
    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack {
                ForEach(exhibitions, id: \.name) { exhibition in
                    ExhibitionView(exhibition: exhibition)
                    .frame(width: 300)
                        .padding(.horizontal, exhibition is Lion ? 200 : 100)
                }
            }
            .padding(.horizontal, 300)
        }
        .coordinateSpace(name: "tab")
    }
}

struct ExhibitionTab_Previews: PreviewProvider {
    static var previews: some View {
        ExhibitionTab(exhibitions: .instruments)
            .previewLayout(.fixed(width: 3000, height: 1024))

    }
}
