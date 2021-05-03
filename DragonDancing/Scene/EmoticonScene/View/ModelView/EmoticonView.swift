//
//  EmoticonView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/1.
//

import SwiftUI

struct EmoticonView: View {
    @EnvironmentObject var emoticonWorld: EmoticonWolrd
    
    let emoticon: Emoticon

    var body: some View {
        Image(emoticon.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .customScaleEffect(in: .named("emoticon_tab")){
                EmptyView()
            }
            .onTapGesture {
                emoticonWorld.emoticonDetail = emoticon
            }
    }
}

struct EmoticonView_Previews: PreviewProvider {
    static var previews: some View {
        EmoticonView(emoticon: [Emoticon].all.randomElement()!)
            .frame(width: 300)
            .environmentObject(EmoticonWolrd())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
