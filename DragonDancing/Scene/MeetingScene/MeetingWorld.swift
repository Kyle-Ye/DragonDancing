//
//  MeetingWorld.swift
//  Demo
//
//  Created by Kyle on 2021/5/9.
//

import SwiftUI

class MeetingWorld: ObservableObject {
    @Published var collectedObjects:[String] = []
    @Published var showBag = false
}
