//
//  InnerViewDemo.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/8/22.
//

import SwiftUI

struct InnerViewDemo: View {
    var color = Color.blue
    
    var body: some View {
        ZStack {
            self.color
            Text("Hello world")
                .foregroundColor(
//                    Color(red: 0.4627, green: 0.8392, blue: 1.0)
                    Color.skyBlue
                )
        }
    }
}

struct InnerViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        InnerViewDemo()
    }
}
