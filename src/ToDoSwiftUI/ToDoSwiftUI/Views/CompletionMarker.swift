import SwiftUI

struct CompletionMarker: View {
    @Binding var completed: Bool
    @State private var showCircle = false
    
    var iconSize: CGSize = CGSize(width: 45, height: 45)
    var tapAction: () -> Void = { }
    
    // Customizable Options
    var circleShowDuration: CGFloat = 0.3
    var circleDismissDuration: CGFloat = 0.3
    var circleAnimationSpan: CGFloat = 0.5
    
    private var circleAnimationDelay: CGFloat {
        circleShowDuration + circleAnimationSpan
    }
    
    private var circleShowAnimation: Animation {
        Animation.easeOut(duration: circleDismissDuration)
    }
    
    var body: some View {
        ZStack {
            if completed {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .foregroundColor(.green)
                    .transition(.scale)
                
            } else {
                Image(systemName: "circle.dashed")
                    .resizable()
                    .foregroundColor(.gray)
                    .transition(.scale)
            }
            
            Image(systemName: "circle.dashed")
                .resizable()
                .foregroundColor(.green)
                .opacity(self.showCircle ? 1 : 0)
                .scaleEffect(self.showCircle ? 1.5 : 1)
        }
        .frame(
            width: iconSize.width,
            height: iconSize.height
        )
        .animation(.bouncyAnimation, value: completed)
        .onChange(of: completed) { newCompleted in
            if newCompleted {
                withAnimation(circleShowAnimation) {
                    self.showCircle = true
                }
                
                withAnimation(
                    circleShowAnimation.delay(circleAnimationDelay)
                ) {
                    self.showCircle = false
                }
            }
        }
        .onTapGesture {
            tapAction()
        }
    }
}

struct CompletionMarker_Previews: PreviewProvider {
    static var previews: some View {
        CompletionMarker(completed: .constant(true))
        CompletionMarker(completed: .constant(false))
    }
}
