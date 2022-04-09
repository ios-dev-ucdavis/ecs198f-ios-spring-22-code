//
//  Color+Utility.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/8/22.
//

import Foundation
import SwiftUI

extension Color: Identifiable {
    static let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    
    public var id: UUID {
        UUID()
    }
//    public var id = UUID()
}
