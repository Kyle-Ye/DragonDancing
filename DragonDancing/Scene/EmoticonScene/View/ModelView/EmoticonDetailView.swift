//
//  EmoticonDetailView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct EmoticonDetailView: View {
    @EnvironmentObject var emoticonWorld: EmoticonWolrd
    let emoticon: Emoticon
    var body: some View {
        HStack(spacing: 50) {
            VStack(alignment: .leading, spacing: 113) {
                Text(emoticon.name)
                    .font(.largeTitle)
                    .foregroundColor(.titleText)
                    .padding(.vertical, 25)
                    .padding(.horizontal, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 13)
                            .strokeBorder(Color.titleText, lineWidth: 2, antialiased: true)
                    )
                    .padding()

                Text(emoticon.description)
                    .foregroundColor(Color("body_text"))
                    .font(.title)
                    .frame(width: 250)
                    .padding(.leading, 100)
            }
            .padding(.leading, 50)
            Image(emoticon.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(idealWidth: 700)
        }
    }
}

struct EmoticonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmoticonDetailView(emoticon: [Emoticon].all.randomElement()!)
            .environmentObject(EmoticonWolrd())
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
