//
//  ScrollViewDemo.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/8/22.
//

import SwiftUI

struct ScrollViewDemo: View {
    var colors = [
        Color.red, Color.blue, Color.green, Color.gray, Color.black, Color.brown, Color.cyan, Color.indigo
    ]
    
    var body: some View {
        ScrollView {
            ForEach(colors) { color in
                InnerViewDemo(color: color)
                    .frame(height: 200)
            }
        }
    }
}

struct ScrollViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemo()
    }
}
