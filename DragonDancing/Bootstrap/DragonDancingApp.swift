//
//  DragonDancingApp.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

@main
struct DragonDancingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    for family in UIFont.familyNames.sorted() {
                        let names = UIFont.fontNames(forFamilyName: family)
                        print("Family: \(family) Font names: \(names)")
                    }
                }
        }
    }
}
