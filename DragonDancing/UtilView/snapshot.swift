//
//  snapshot.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/1.
//

import SwiftUI

extension View {
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        let targetSize = controller.view.intrinsicContentSize
        controller.view.bounds = CGRect(origin: .zero, size: targetSize)
        controller.view.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
