//
//  VerticalText.swift
//  DragonDancing
//
//  Created by Kyle on 2021/4/28.
//

import SwiftUI

struct VerticalText: View {
    var text: String

    private var lines: [String] {
        text.split(separator: "\n").reversed().map { String($0) }
    }

    var body: some View {
        HStack(alignment: .top) {
            ForEach(lines, id: \.self) { line in
                Text(line)
                    .frame(width: 30)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 30)
            }
        }
    }
}

struct VerticalText_Previews: PreviewProvider {
    static var previews: some View {
        VerticalText(text:
            """
            离骚
            帝高阳之苗裔兮，朕皇考曰伯庸。
            摄提贞于孟陬兮，惟庚寅吾以降。
            皇览揆余初度兮，肇锡余以嘉名。
            名余曰正则兮，字余曰灵均。
            """)
            .previewLayout(.sizeThatFits)
    }
}
