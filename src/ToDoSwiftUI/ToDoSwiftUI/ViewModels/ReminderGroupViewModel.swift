import Foundation
import SwiftUI
import Combine

class ReminderGroupViewModel: ObservableObject {
    @Published var reminderGroup = ReminderGroup()
    
    private(set) var reminderGroupId: UUID
    private var cancellable: AnyCancellable?
    private let reminderGroupRepo = ReminderGroupRepository.instance
    
    var labelColor: Color {
        self.reminderGroup.labelColor
    }
    
    var name: String {
        self.reminderGroup.name
    }
    
    var reminderIds: [UUID] {
        self.reminderGroup.reminders
    }
    
    init(_ reminderGroupId: UUID) {
        self.reminderGroupId = reminderGroupId
        self.loadReminderGroup()
        self.cancellable = self.$reminderGroup
            .dropFirst()
            .sink { [weak self] newReminderGroup in
                guard let self = self else { return }
                self.reminderGroupRepo.update(self.reminderGroupId, with: newReminderGroup)
            }
    }
    
    func changeLabelColor(to color: Color) {
        reminderGroup.changeLabelColor(to: color)
    }
    
    func loadReminderGroup() {
        if let reminderGroupForReading = reminderGroupRepo.read(reminderGroupId) {
            self.reminderGroup = reminderGroupForReading
        }
    }
    
    func addReminder(_ reminder: Reminder) {
        var reminder = reminder
        reminder.groupId = reminderGroupId
        ReminderRepository.instance.create(reminder)
        self.reminderGroup.addReminder(reminder)
    }
    
    // New function for updating a reminder
    func updateReminder(_ reminder: Reminder ) {
        ReminderRepository.instance.update(reminder.id, with: reminder)
    }
    
    // New function for removing a reminder
    func removeReminder(_ reminder: Reminder) {
        withAnimation(.bouncyAnimation.delay(1)) {
            self.reminderGroup.removeReminder(reminder)
        }
    }
}

