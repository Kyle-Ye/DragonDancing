//
//  OrgansView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import SwiftUI

struct OrgansView: View {
    let organs:[Organ]
    
    var body: some View {
        ZStack {
            ForEach(organs, id: \.name) { organ in
                Image("\(organ.name)_\(organ.style + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(organ.color)
            }
        }
    }
}

struct OrgansView_Previews: PreviewProvider {
    static var previews: some View {
        OrgansView(organs: .all)
            .environmentObject(DIYWorld())
    }
}
