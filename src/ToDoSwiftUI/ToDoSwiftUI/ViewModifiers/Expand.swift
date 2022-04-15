//
//  Expand.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/12/22.
//

import SwiftUI

enum ExpandDirection {
    case horizontal
    case vertical
    case all
}

struct Expand: ViewModifier {
    var horizon: Bool = true
    var vertical: Bool = true
    
    init(_ direction: ExpandDirection = .all) {
        switch (direction) {
        case .vertical:
            self.horizon = false
        case .horizontal:
            self.vertical = false
        case .all:
            break
        }
    }
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: self.horizon ? .infinity : nil)
            .frame(maxHeight: self.vertical ? .infinity : nil)
    }
}
