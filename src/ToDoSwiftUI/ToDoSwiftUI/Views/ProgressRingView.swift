import SwiftUI

struct ProgressRingView: View {
    var activeColor: Color = .cyan
    var cardCornerRadius: CGFloat = 15
    var strokeWidth: CGFloat = 2
    var stepProgress: CGFloat = 0
    
    var body: some View {
        RoundedRectangle(
            cornerRadius: cardCornerRadius,
            style: .circular
        )
        .inset(by: strokeWidth / 2)
        .trim(from: 0, to: stepProgress)
        .stroke(
            activeColor,
            style: StrokeStyle(
                lineWidth: strokeWidth, lineCap: .round
            )
        )
        .rotationEffect(Angle(degrees: 180))
        .animation(.default, value: stepProgress)
    }
}

struct ProgressRingView_Previews: PreviewProvider {
    static let cornerRadius: CGFloat = 10
    
    static var previews: some View {
        ProgressRingView(cardCornerRadius: cornerRadius, stepProgress: 0.6)
            .frame(width: 200, height: 100)
            .cornerRadius(cornerRadius)
    }
}
