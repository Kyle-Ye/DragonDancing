//
//  SealWorld.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/9.
//

import SwiftUI

class SealWorld: ObservableObject {
    @Published var showShareSheet = false
    @Published var captureImage = false
    @Published var shareImage: UIImage?
    @Published var activeBackground = 0
    @Published var seals: [Seal] = []
    @Published var selectedSeals: Set<Seal> = []
    var background = ["印章底-1", "印章底-2", "印章底-3"]
    func addSeal(_ name: String, at location: CGPoint, size: Double) {
        seals.append(Seal(name: name, x: Double(location.x), y: Double(location.y), size: size))
    }

    func deleteSeal(_ seal: Seal) {
        seals.remove(at: seals.firstIndex(of: seal)!)
    }
    
    func scaleSeal(_ seal: Seal, by scale: Double) {
        if let index = seals.firstIndex(of: seal) {
            seals[index].size *= scale
        }
    }
    func moveSeal(_ seal: Seal, by offset: CGSize) {
        if let index = seals.firstIndex(of: seal) {
            seals[index].x += Double(offset.width)
            seals[index].y += Double(offset.height)
        }
    }}
