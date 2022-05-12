import SwiftUI

extension View {
    @ViewBuilder
    func progressable(
        activeColor: Color = .cyan,
        cardCornerRadius: CGFloat,
        strokeWidth: CGFloat,
        stepProgress: CGFloat,
        show: Bool = true
    ) -> some View {
        if show {
            self.modifier(
                Progressable(
                    cardCornerRadius: cardCornerRadius,
                    strokeWidth: strokeWidth,
                    stepProgress: stepProgress
                )
            )
        } else {
            self
        }
    }
}
