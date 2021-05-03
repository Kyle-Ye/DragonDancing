//
//  Exhibition.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import Foundation
import SwiftUI

protocol Exhibition {
    var name: String { get }
    var description: String { get }
    var lineImageName: String { get }
    var colorImageName: String { get }
    var nameOffset: CGSize { get }
}

extension Array where Element == Exhibition {
    static let instruments = [Instrument].all
    static let tools = [Tool].all
    static let lions = [Lion].all
}
