//
//  OrganNode.swift
//  DragonDancing
//
//  Created by Kyle on 2021/10/22.
//

import Foundation
import SceneKit

class OrganNode: SCNNode {
    var organ: Organ

    init(with organ: Organ, width: CGFloat = 0.06, height: CGFloat = 0.06) {
        self.organ = organ
        super.init()
        name = String(organ.name)
        let plane = SCNPlane(width: width, height: height)
        let image = UIImage(named: organ.imageName)
        plane.firstMaterial?.diffuse.contents = image?.withTintColor(UIColor(organ.color))
        plane.firstMaterial?.isDoubleSided = true
        geometry = plane
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrganNode {
    func updatePosition(for vectors: [vector_float3]) {
        let newPos = vectors.reduce(vector_float3(), +) / Float(vectors.count)
        position = SCNVector3(newPos)
    }

    func updateNode(with organ: Organ) {
        guard let plane = geometry as? SCNPlane,
              self.organ != organ else { return }
        self.organ = organ
        let image = UIImage(named: organ.imageName)
        let tintImage = image?.tintWithColor(color: UIColor(organ.color))
        plane.firstMaterial?.diffuse.contents = tintImage
    }
}

extension UIImage {
    func tintWithColor(color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext(),
              let cgImage = cgImage else { return nil }
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -self.size.height)

        context.setBlendMode(.multiply)
        let rect = CGRect(origin: .zero, size: size)
        context.clip(to: rect, mask: cgImage)
        color.setFill()
        context.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 20, height: 22)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.set()

        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))

        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 15)])

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }
}
