import SwiftUI

struct Progressable: ViewModifier {
    var activeColor: Color = .cyan
    var inactiveColor: Color = .clear
    var cardCornerRadius: CGFloat
    var strokeWidth: CGFloat
    var stepProgress: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                ProgressRingView(
                    activeColor: activeColor,
                    cardCornerRadius: cardCornerRadius,
                    strokeWidth: strokeWidth,
                    stepProgress: stepProgress
                )
            )
    }
}
