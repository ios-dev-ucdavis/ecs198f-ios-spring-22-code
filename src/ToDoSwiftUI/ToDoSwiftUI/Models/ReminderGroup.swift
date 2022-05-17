import Foundation
import SwiftUI

struct ReminderGroup: Identifiable {
    var id = UUID()
    var name = "New Group"
    var note: String?
    var reminders: [UUID] = []
    var labelColor = Color.blue
    
    // MARK: Initializers
    init() {}
    init(name: String) { self.name = name }
    
    
    // MARK: Member Functions
    mutating func changeName(to name: String) {
        self.name = name
    }
    
    mutating func changeLabelColor(to color: Color) {
        self.labelColor = color
    }
    
    // New function for adding reminder
    mutating func addReminder(_ reminder: Reminder) {
        self.reminders.append(reminder.id)
    }
    
    // MARK: Newly added helper function for generating fake reminder groups
    static func getFakeReminderGroup(named name: String? = nil, with note: String? = nil) -> ReminderGroup {
        var reminderGroup = ReminderGroup()
        if let name = name {
            reminderGroup.name = name
        }
        reminderGroup.note = note
        for _ in 0...Int.random(in: 4...10) {
            var reminder = Reminder(groupId: reminderGroup.id)
            reminder.steps = UserData.possibleStepsCollecton.randomElement()!
            let possibleName = UserData.possibleReminderNames.randomElement()!
            reminder.title = possibleName.0
            reminder.note = possibleName.1
            
            reminderGroup.addReminder(reminder)
            
            UserData.reminders.append(reminder)
        }
        return reminderGroup
    }
}
