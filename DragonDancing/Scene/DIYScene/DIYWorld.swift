//
//  DIYWorld.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/5.
//

import SwiftUI

class DIYWorld: ObservableObject {
    @Published var organs: [Organ] = .all
    @Published var activeIndex = 0
    @Published var showShareSheet = false

    public let colors: [Color] = [
         Color(red: 0.09, green: 0.27, blue: 0.52),
         Color(red: 0.17, green: 0.56, blue: 0.49),
         Color(red: 0.84, green: 0.54, blue: 0.36),
         Color(red: 0.72, green: 0.13, blue: 0.18),
         Color(red: 0.54, green: 0.17, blue: 0.26),
         Color(red: 0.29, green: 0.20, blue: 0.19),
    ]

    func getOrgansImage() -> UIImage {
        let controller = UIViewController(nibName: nil, bundle: nil)
        let view:UIView! = controller.view
        for organ in organs {
            let image = UIImage(named: "\(organ.name)_\(organ.style + 1)")
            let imageView = UIImageView(image: image)
            imageView.tintColor = UIColor(organ.color)
            view.addSubview(imageView)
        }
        let targetSize = view.subviews[0].intrinsicContentSize
        controller.view.bounds = CGRect(origin: .zero, size: targetSize)
        controller.view.backgroundColor = .clear

        let renderer = UIGraphicsImageRenderer(size: targetSize)

        return renderer.image { _ in
            view.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
