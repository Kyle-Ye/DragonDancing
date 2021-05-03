//
//  ExhibitionWorld.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

class ExhibitionWolrd: ObservableObject {
    @Published var exhibitionDetail: Exhibition?
    @Published var currentTab: Int = 0
}
