import SwiftUI

extension View {
    func expand(_ direction: ExpandDirection = .all) -> some View {
        self.modifier(Expand(direction))
    }
}
