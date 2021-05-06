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
        Image("mouse")
            .resizable()
            .frame(idealHeight: 500)
            .padding()
            .border(Color.titleText)
    }
}

struct CultureView_Previews: PreviewProvider {
    static var previews: some View {
        CultureView(culture: [Culture].all.randomElement()!)
    }
}
