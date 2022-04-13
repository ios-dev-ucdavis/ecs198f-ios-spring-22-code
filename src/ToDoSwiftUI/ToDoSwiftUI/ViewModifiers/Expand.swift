//
//  Expand.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/12/22.
//

import SwiftUI

struct Expand: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
