//
//  ReminderGroupViewModel.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/14/22.
//

import SwiftUI

class ReminderGroupViewModel: ObservableObject {
    @Published var reminderGroup = ReminderGroup(name: "Unnamed Group")
    
    init(_ name: String) {
        self.reminderGroup = ReminderGroup(name: name)
    }
    
    init() {}
    
    var labelColor: Color {
        self.reminderGroup.labelColor
    }
    
    var name: String {
        self.reminderGroup.name
    }
    
    func changeLabelColor(to color: Color) {
        self.reminderGroup.changeLabelColor(to: color)
    }
}
