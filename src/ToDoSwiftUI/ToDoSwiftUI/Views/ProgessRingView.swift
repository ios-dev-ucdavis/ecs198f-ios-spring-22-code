//
//  ProgessRingView.swift
//  ToDo
//
//  Created by Yibo Yan on 4/19/22.
//

import SwiftUI

struct ProgessRingView: View {
    var activeColor: Color = .cyan
    var cardCornerRadius: CGFloat = 15
    var strokeWidth: CGFloat = 2
    @State var stepProgress: CGFloat = 0
    
    var body: some View {
        VStack {
            RoundedRectangle(
                cornerRadius: cardCornerRadius,
                style: .circular
            )
            .inset(by: strokeWidth / 2)
            .trim(from: 0, to: stepProgress)
            .stroke(
                .cyan,
                style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round)
            )
            .rotationEffect(Angle(degrees: 180))
            .animation(.default, value: stepProgress)
                
            
            testButton
        }
    }
    
    var testButton: some View {
        Button("Increase Progess") {
            self.stepProgress += 0.2
            if self.stepProgress > 1 {
                self.stepProgress = 0
            }
        }
    }
}

struct ProgessRingView_Previews: PreviewProvider {
    static let cornerRadius: CGFloat = 10
    
    static var previews: some View {
        ProgessRingView(cardCornerRadius: cornerRadius)
            .frame(width: 200, height: 100)
            .cornerRadius(cornerRadius)
    }
}
