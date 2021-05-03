//
//  DotSlider.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/28.
//

import SwiftUI

struct DotSlider: View {
    var number: Int = 3
    var showLine: Bool = true
    @Binding var value: Int
    private let spacing: CGFloat = 80
    private let inactiveRadius:CGFloat = 20
    private let activeRadius:CGFloat = 30

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< number) { index in
                Circle()
                    .foregroundColor(.accentColor)
                    .frame(
                        width: (value == index) ? activeRadius : inactiveRadius,
                        height: (value == index) ? activeRadius : inactiveRadius
                    )
                    .onTapGesture {
                        value = index
                    }
                    .animation(.spring())
            }
        }
        .background(
            VStack {
                if showLine {
                    Rectangle()
                        .foregroundColor(.accentColor)
                        .frame(height: 6, alignment: .center)
                }
            }
        )
    }
}

struct LineSlider_Previews: PreviewProvider {
    static var previews: some View {
        DotSlider(number: 5, value: .constant(2))
    }
}
