//
//  OrgansView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import SwiftUI

struct OrgansView: View {
    @EnvironmentObject var model: OrganWorld
    let organs: [Organ]

    var body: some View {
        ZStack {
            ForEach(organs, id: \.name) { organ in
                Image("\(organ.name)_\(organ.style + 1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(organ.color)
            }
        }
        .animation(.spring())
        .contextMenu {
            Button(action: {
                model.showShareSheet.toggle()
            }) {
                Text("分享")
                Image(systemName: "square.and.arrow.up")
            }
        }
        .sheet(isPresented: $model.showShareSheet, content: {
            ActivityView(image: model.getOrgansImage())
        })
    }
}

struct OrgansView_Previews: PreviewProvider {
    static var previews: some View {
        OrgansView(organs: .all)
            .environmentObject(DIYWorld())
    }
}
