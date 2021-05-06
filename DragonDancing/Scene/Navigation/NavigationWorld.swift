//
//  World.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

class NavigationWorld: ObservableObject {
    @Published var currentTab: SceneTab = .home
    @Published var showMenu: Bool = true
    @Published var menu: AnyView?
}

enum SceneTab: Int {
    case home
    case action
    case emotion
    case exhibition
    case diy
}
