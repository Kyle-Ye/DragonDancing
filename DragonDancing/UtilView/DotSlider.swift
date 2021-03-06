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
    var spacing: CGFloat = 80
    private let inactiveRadius:CGFloat = 13
    private let activeRadius:CGFloat = 20

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0 ..< number, id: \.self) { index in
                Circle()
                    .foregroundColor(.accentColor)
                    .frame(
                        width: (value == index) ? activeRadius : inactiveRadius,
                        height: (value == index) ? activeRadius : inactiveRadius
                    )
                    .onTapGesture {
                        value = index
                    }
                    .animation(.spring(), value: value)
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
