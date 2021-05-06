//
//  ActionScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI

struct ActionScene: View {
    var body: some View {
        ActionTab(actions: .all)
    }
}

struct ActionScene_Previews: PreviewProvider {
    static var previews: some View {
        ActionScene()
            .previewLayout(.fixed(width: 1366, height: 1024))
    }
}
