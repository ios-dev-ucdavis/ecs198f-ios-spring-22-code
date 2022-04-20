//
//  AnimationDemo2.swift
//  ToDoDemoSwiftUI
//
//  Created by Yibo Yan on 4/19/22.
//

import SwiftUI

struct AnimationDemo2: View {
    @State var showRect = false
    @State var rectWidth: CGFloat = 100
    
    var body: some View {
        VStack {
            if showRect {
                Rectangle()
                    .frame(width: rectWidth, height: 100)
//                    .animation(.default, value: showRect)
            }
            
            Button("Show/Hide") {
                withAnimation {
                    self.showRect.toggle()
                }
            }
            
            Button("Change Width") {
                self.rectWidth = self.rectWidth == 100 ? 200 : 100
            }
        }
    }
}

struct AnimationDemo2_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo2()
    }
}
