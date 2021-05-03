//
//  GIFImage.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/2.
//

import SwiftUI
import SwiftyGif

struct GIFImage: UIViewRepresentable {
    var named: String
    func makeUIView(context: Context) -> UIImageView {
        let gif = try! UIImage(gifName: named)
        let imageView = UIImageView(gifImage: gif, loopCount: -1)
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
    }
}

struct GIFImage_Previews: PreviewProvider {
    static var previews: some View {
        GIFImage(named: "demo")
    }
}
