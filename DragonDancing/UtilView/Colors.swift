//
//  Colors.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/28.
//

import SwiftUI

extension Color {
    static let background = Color("background")
    static let titleText = Color("title_text")
    static let bodyText = Color("body_text")
}

struct Colors_Previews: PreviewProvider {
    static let colors: [Color] =
        [.background, .titleText, .bodyText]
    static var previews: some View {
        return
            HStack {
                ZStack {
                    Color.white
                    VStack {
                        ForEach(colors, id: \.self) { color in
                            color
                        }
                        .padding()
                    }
                }

                ZStack {
                    Color.black
                    VStack {
                        ForEach(colors, id: \.self) { color in
                            color
                        }
                        .padding()
                    }
                }
            }
    }
}
