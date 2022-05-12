import SwiftUI

extension AnyTransition {
    static var drawViewOutTransition: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
        let removal = AnyTransition.move(edge: .bottom)
        return .asymmetric(insertion: insertion, removal: removal)
    }
    
    static var floatingMenuPopup: AnyTransition {
        let insertion = AnyTransition.opacity.combined(with: .scale).combined(with: .move(edge: .trailing))
        let removal = AnyTransition.opacity.combined(with: .scale).combined(with: .move(edge: .trailing))
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
