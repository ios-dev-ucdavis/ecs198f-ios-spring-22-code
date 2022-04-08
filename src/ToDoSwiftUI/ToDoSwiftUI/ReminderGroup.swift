//
//  ReminderGroup.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/7/22.
//

import Foundation
import SwiftUI

struct ReminderGroup {
    var name = "Unnamed Reminder Group"
    var reminders: [UUID] = []
    var labelColor: Color = .blue
    
    init(name: String) {
        self.name = name
    }
    
    mutating func changeName(to name: String) {
        self.name = name
    }
    
    mutating func changeLabelColor(to color: Color) {
        self.labelColor = color
    }
}
