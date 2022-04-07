//
//  DevicePreview.swift
//  DragonDancing
//
//  Created by KyleYe on 2022/4/7.
//

import Foundation
import SwiftUI

extension View {
    func preview(on devices: [PreviewDevice]) -> some View {
        ForEach(devices, id: \.rawValue) { device in
            self.previewDevice(device)
                .previewDisplayName(device.rawValue)
        }
    }
}

extension Array where Element == PreviewDevice {
    static var iPadDevices: [PreviewDevice] = [
        "iPad mini 4",
        "iPad Air (3rd generation)",
        "iPad Pro (9.7-inch)",
        "iPad Pro (9.7-inch)",
        "iPad Pro (12.9-inch) (5th generation)",
    ]
}
