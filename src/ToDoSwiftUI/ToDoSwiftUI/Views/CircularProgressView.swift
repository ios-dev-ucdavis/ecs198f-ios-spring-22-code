import SwiftUI

struct CircularProgressView: View {
    var activeColor: Color = .cyan
    var strokeWidth: CGFloat = 10
    var stepProgress: CGFloat = 0.3
    
    var body: some View {
        Circle()
            .inset(by: strokeWidth / 2)
            .stroke(
                Color.gray.opacity(0.2),
                style: StrokeStyle(
                    lineWidth: strokeWidth,
                    lineCap: .round
                )
            )
            .overlay(
                topRing
            )
    }
    
    var topRing: some View {
        Circle()
            .inset(by: strokeWidth / 2)
            .trim(from: 0, to: stepProgress)
            .stroke(
                activeColor,
                style: StrokeStyle(
                    lineWidth: strokeWidth,
                    lineCap: .round
                )
            )
            .rotationEffect(Angle(degrees: -90))
            .animation(.default, value: stepProgress)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
            .frame(width: 50, height: 50)
    }
}
