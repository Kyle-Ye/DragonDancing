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
                Image(organ.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(organ.color)
            }
        }
        .animation(.spring())
        .snapshot(model.captureImage, completion: { image in
            model.captureImage.toggle()
            model.shareImage = image
            model.showShareSheet = true
        })
        .contextMenu {
            Button(action: {
                model.captureImage.toggle()
            }) {
                Text("分享")
                Image(systemName: "square.and.arrow.up")
            }
        }
        .sheet(isPresented: $model.showShareSheet, content: {
            ActivityView(image: model.shareImage!,title: "DIY狮头")
        })
    }
}

struct OrgansView_Previews: PreviewProvider {
    static var previews: some View {
        OrgansView(organs: .all)
            .environmentObject(DIYWorld())
    }
}
