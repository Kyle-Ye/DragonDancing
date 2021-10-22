//
//  OrgansARView.swift
//  DragonDancing
//
//  Created by Kyle on 2021/10/22.
//

import ARKit
import Combine
import Foundation
import SwiftUI

struct OrgansARView: UIViewControllerRepresentable {
    var organs: [Organ]
    var showLine: Bool

    func makeUIViewController(context: Context) -> OrgansViewController {
        let vc = OrgansViewController()
        return vc
    }

    func updateUIViewController(_ vc: OrgansViewController, context: Context) {
        vc.organs = organs
        vc.showLine = showLine
    }

    typealias UIViewControllerType = OrgansViewController
}

class OrgansViewController: UIViewController {
    var sceneView: ARSCNView!

    var organs: [Organ] = []
    var showLine: Bool = false

    // cavity eyes nose mouse decoration
    let sizes = [0.16, 0.2, 0.13, 0.15, 0.2]
    let featureIndices = [[1064, 42], [1064, 42], [9], [25, 24], [9]]

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView(frame: .zero)
        view = sceneView
        // Do any additional setup after loading the view.
        guard ARFaceTrackingConfiguration.isSupported else { fatalError() }
        sceneView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARFaceTrackingConfiguration()
        sceneView.session.run(configuration)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }

    func updateFeatures(for node: SCNNode, using anchor: ARFaceAnchor) {
        for (index, organ) in organs.enumerated() {
            let child = node.childNode(withName: organ.name, recursively: false) as? OrganNode
            let indices = featureIndices[index]
            let vertices = indices.map { anchor.geometry.vertices[$0] }
            child?.updatePosition(for: vertices)
            child?.updateNode(with: organ)
            switch organ.name {
            case "eyes":
                let scaleX = child?.scale.x ?? 1.0
                let eyeBlinkValue = ((anchor.blendShapes[.eyeBlinkLeft]?.floatValue ?? 0.0) + (anchor.blendShapes[.eyeBlinkRight]?.floatValue ?? 0.0)) / 2
                child?.scale = SCNVector3(scaleX, 1.0 - eyeBlinkValue, 1.0)
            case "mouse":
                let jawOpenValue = anchor.blendShapes[.jawOpen]?.floatValue ?? 0.2
                child?.scale = SCNVector3(1.0, 0.8 + jawOpenValue, 1.0)
            default:
                break
            }
        }
    }
}

extension OrgansViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let faceAnchor = anchor as? ARFaceAnchor,
              let device = sceneView.device,
              let faceGeometry = ARSCNFaceGeometry(device: device, fillMesh: true) else { return nil }

        let node = SCNNode(geometry: faceGeometry)
        if let material = node.geometry?.firstMaterial {
            if showLine {
                material.lightingModel = .physicallyBased
                material.transparency = showLine ? 1.0 : 0.0
                material.diffuse.contents = UIColor.white
            }
        }
        for (organ, size) in zip([Organ].all, sizes) {
            let organNode = OrganNode(with: organ, width: size, height: size)
            node.addChildNode(organNode)
            organNode.pivot = SCNMatrix4MakeTranslation(0, 0, -0.005)
            if organ.name == "mouse" {
                organNode.pivot = SCNMatrix4MakeTranslation(0, -0.04, -0.005)
            }
        }

//        for (index, vertics) in faceAnchor.geometry.vertices.enumerated() {
//            let numberNode = SCNNode()
//            numberNode.name = "\(index)"
//            let plane = SCNPlane(width: 0.003, height: 0.003)
//            plane.firstMaterial?.diffuse.contents = "\(index)".image()
//            plane.firstMaterial?.isDoubleSided = true
//            numberNode.geometry = plane
//            numberNode.position = SCNVector3(vertics)
//            node.addChildNode(numberNode)
//        }
        updateFeatures(for: node, using: faceAnchor)
        return node
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = anchor as? ARFaceAnchor,
              let faceGeometry = node.geometry as? ARSCNFaceGeometry else { return }
        faceGeometry.update(from: faceAnchor.geometry)
        updateFeatures(for: node, using: faceAnchor)
    }
}
