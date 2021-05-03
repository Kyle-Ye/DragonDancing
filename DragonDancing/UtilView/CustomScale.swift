//
//  CustomScale.swift
//  DragonDancing
//
//  Created by Kyle on 2021/5/3.
//

import SwiftUI

struct CustomScale<Active>: ViewModifier where Active: View {
    let coordinateSpace: CoordinateSpace
    let minScale: CGFloat
    let maxScale: CGFloat
    let threshold: CGFloat
    let activeView: () -> Active
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            ZStack {
                content
                if scaleFactor(in: geometry) > threshold {
                    activeView()
                }
            }
            .animation(.spring())
            .scaleEffect(scaleFactor(in: geometry))
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .center)
//                        .overlay(
//                            VStack {
//                                Text("factor is \(scaleFactor(in: geometry))")
//                                Text("frame in tab: \(geometry.frame(in: .named("tab")).midX)")
//                                Text("frame in global: \(geometry.frame(in: .global).midX)")
//                            }
//                        )
        }
    }

    private func scaleFactor(in geometry: GeometryProxy) -> CGFloat {
        let local = geometry.frame(in: coordinateSpace).midX
        let global = geometry.frame(in: .global).midX
        let menuWidth = global - local
        let midWidth = UIScreen.main.bounds.midX + menuWidth / 2
        let offset = global - midWidth

        var factor = exp(-abs(offset / 300))
        // transform factor from 0 - 1 to min - max
        factor = factor * (maxScale - minScale) / (1 - 0) + minScale
        return factor
    }
}

extension View {
    func customScaleEffect<Content>(in coordinateSpace: CoordinateSpace,
                                    minScale: CGFloat = 0.8,
                                    maxScale: CGFloat = 1.6,
                                    threshold: CGFloat = 1.3,
                                    @ViewBuilder content: @escaping () -> Content) -> some View
        where Content: View {
        return modifier(
            CustomScale(coordinateSpace: coordinateSpace,
                        minScale: minScale,
                        maxScale: maxScale,
                        threshold: 1.3,
                        activeView: content)
        )
    }
}
