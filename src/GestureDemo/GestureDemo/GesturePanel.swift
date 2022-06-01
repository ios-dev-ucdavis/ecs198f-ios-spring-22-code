//
//  GesturePanel.swift
//  GestureDemo
//
//  Created by Yibo Yan on 5/31/22.
//

import SwiftUI

struct GesturePanel: View {
    @State var isTapped = false
    @GestureState var isLongPressing = false
//    @GestureState var draggedTranslation = CGSize.zero
    @State var draggedTranslation = CGSize.zero
    @GestureState var magnificationScale: CGFloat = 1
    
    var tapGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                isTapped.toggle()
            }
    }
    
    var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: .infinity)
            .updating($isLongPressing) { value, state, _ in
                state = value
            }
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                draggedTranslation = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    draggedTranslation = CGSize.zero
                }
            }
//            .updating($draggedTranslation) { value, state, _ in
//                state = value.translation
//            }
    }
    
    var magGesture: some Gesture {
        MagnificationGesture()
            .updating($magnificationScale) { value, state, _ in
                state = value
            }
    }
    
    
    var circle: some View {
        Circle()
            .fill(isTapped ? .green : .red)
            .frame(width: 100, height: 100)
    }
    
    var body: some View {
        VStack {
            circle
                .scaleEffect(magnificationScale)
                .gesture(magGesture)
//                .offset(draggedTranslation)
//                .gesture(dragGesture)
//                .gesture(
//                    tapGesture
//                )
//                .gesture(
//                    longPressGesture
//                )
//            Text("TapGesture State: \(self.isTapped.description)")
            Text("LongPressGesture State: \(self.isLongPressing.description)")
        }
    }
}

struct GesturePanel_Previews: PreviewProvider {
    static var previews: some View {
        GesturePanel()
    }
}
