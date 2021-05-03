//
//  HomeScene.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/20.
//

import SwiftUI

struct HomeScene: View {
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                Spacer()
                TimeLine()
            }
            VStack {
                Spacer()
                HStack {
                    ButtonGroup(labels: ["集市", "长卷", "表情包"])
                }
            }
        }
    }
}

struct TimeLine: View {
    var body: some View {
        VStack {
            Text("北市")
            Text("南市")
        }
    }
}

struct ButtonGroup: View {
    var labels: [String]

    var body: some View {
        HStack {
            ForEach(labels, id: \.self) { label in
                Text("\(label)")
                    .font(.title)
                    .padding(.horizontal, 30)
                if labels.last != label {
                    Rectangle()
                        .fill()
                        .foregroundColor(.purple)
                        .frame(width: 2, height: 35)
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(Color.purple, lineWidth: 3, antialiased: true)
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}
