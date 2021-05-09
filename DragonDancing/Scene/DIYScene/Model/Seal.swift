//
//  Seal.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/9.
//

import Foundation
import SwiftUI

struct Seal: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    var x: Double
    var y: Double
    var size: Double

    static func == (lhs: Seal, rhs: Seal) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Seal {
    var fontSize: CGFloat { CGFloat(size) }
    var location: CGPoint { CGPoint(x: x, y: y) }
}
