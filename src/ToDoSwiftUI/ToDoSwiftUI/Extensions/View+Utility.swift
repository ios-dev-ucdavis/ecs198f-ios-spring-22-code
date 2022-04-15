//
//  View+Utility.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/14/22.
//

import Foundation
import SwiftUI

extension View {
    func expand(_ direction: ExpandDirection = .all) -> some View {
        self.modifier(Expand(direction))
    }
}
