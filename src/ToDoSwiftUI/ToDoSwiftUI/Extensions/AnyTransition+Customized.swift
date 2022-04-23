//
//  AnyTransition+Customized.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/21/22.
//

import SwiftUI

extension AnyTransition {
    static var floatingMenuPopup: AnyTransition {
        AnyTransition.opacity.combined(with: .scale).combined(with: move(edge: .trailing))
    }
}
