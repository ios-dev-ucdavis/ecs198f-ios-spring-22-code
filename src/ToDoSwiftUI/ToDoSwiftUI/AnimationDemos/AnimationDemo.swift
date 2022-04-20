//
//  AnimationDemo.swift
//  ToDoDemoSwiftUI
//
//  Created by Yibo Yan on 4/19/22.
//

import SwiftUI

struct AnimationDemo: View {
    @State var width: CGFloat = 150
    @State var height: CGFloat = 150
    @State var opacity: CGFloat = 1
    @State var switchColor = false
    @State var scale: CGFloat = 1
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(switchColor ? Color.red : Color.yellow)
                .frame(width: self.width)
                .frame(height: self.height)
                .opacity(opacity)
                .scaleEffect(scale)
//                .animation(.default, value: width)
                .animation(.linear(duration: 2), value: height)
                .animation(.interpolatingSpring(stiffness: 100, damping: 10), value: scale)
                .animation(.default, value: opacity)
                .animation(.default, value: switchColor)
            
            controls
                .animation(.linear(duration: 2), value: height)
        }
    }
    
    var controls: some View {
        VStack {
            HStack {
                Button("Change Width") {
                    if width == 300 {
                        width = 150
                    } else {
                        withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                            width = 300
                        }
                    }
//                    width = width == 300 ? 150 : 300
                }
                Button("Change Height") {
                    height = height == 300 ? 150 : 300
                }
            }
            
            Button("Change Opacity") {
                opacity = opacity == 0 ? 1 : 0
            }
            
            Button("Change Color") {
                switchColor.toggle()
            }
            
            Button("Change Scale") {
                scale = scale == 1 ? 1.5 : 1
            }
        }
    }
}

struct AnimationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemo()
    }
}
