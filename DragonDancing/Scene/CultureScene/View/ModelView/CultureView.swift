//
//  CultureView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/6.
//

import SwiftUI

struct CultureView: View {
    let culture: Culture
    var body: some View {
        Image(culture.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(idealHeight: 300)
            .padding(50)
            .border(Color.titleText)
    }
}

struct CultureView_Previews: PreviewProvider {
    static var previews: some View {
        CultureView(culture: [Culture].all.randomElement()!)
    }
}
