import SwiftUI

extension Animation {
    static let drawerOutAnimation = Animation.interpolatingSpring(mass: 0.8, stiffness: 45, damping: 45, initialVelocity: 10)
    
    static let bouncyAnimation = Animation.spring(response: 0.55, dampingFraction: 0.6, blendDuration: 0)
}
