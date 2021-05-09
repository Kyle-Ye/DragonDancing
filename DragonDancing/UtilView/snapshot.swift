//
//  snapshot.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/1.
//

import SwiftUI

extension View {
    func snapshot(_ show: Bool, completion: @escaping (UIImage) -> Void) -> some View {
        if show {
            let controller = UIHostingController(rootView: self)
            let view = controller.view
            let targetSize = controller.view.intrinsicContentSize
            controller.view.bounds = CGRect(origin: .zero, size: targetSize)
            controller.view.backgroundColor = .clear

            let renderer = UIGraphicsImageRenderer(size: targetSize)
            let image = renderer.image { _ in
                view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
            }
            completion(image)
        }
        return self
    }
}
