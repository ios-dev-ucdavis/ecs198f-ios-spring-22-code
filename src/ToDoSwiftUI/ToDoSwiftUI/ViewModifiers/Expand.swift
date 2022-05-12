import Foundation
import SwiftUI

enum ExpandDirection {
    case horizontal
    case vertical
    case all
}

struct Expand: ViewModifier {
    var horizontal: Bool = true
    var vertical: Bool = true
    
    init(_ direction: ExpandDirection = .all) {
        switch (direction) {
        case .vertical:
            self.horizontal = false
        case .horizontal:
            self.vertical = false
        case .all:
            break
        }
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: self.horizontal ? .infinity : nil)
            .frame(maxHeight: self.vertical ? .infinity : nil)
    }
}
