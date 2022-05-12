import Foundation
import Combine
import SwiftUI

class ReminderViewModel: ObservableObject {
    private(set) var reminderId: UUID
    private var cancellable: AnyCancellable?
    private var previewNum: Int = 3
    @Published var reminder: Reminder = Reminder()
    
    var stepProgress: Double {
        // TODO: Finish this.
        // It should return a number between 0 and 1,
        // indicating the ratio of finished steps.
        if reminder.steps.isEmpty {
            return reminder.finished ? 1 : 0
        }
        
        return Double(reminder.steps.filter({ $0.finished }).count) / Double(reminder.steps.count)
    }
    
    init(_ reminderId: UUID, previewNum: Int = 3) {
        self.reminderId = reminderId
        self.previewNum = previewNum
        self.loadReminder()
        self.cancellable = self.$reminder
            .dropFirst()
            .sink { newReminder in
                ReminderRepository.instance.update(reminderId, with: newReminder)
            }
    }
    
    // MARK: - Only for preview to work
    init(reminder: Reminder, previewNum: Int = 3) {
        self.reminderId = reminder.id
        self.reminder = reminder
        self.previewNum = previewNum
    }
    
    func loadReminder() {
        if let reminderFromReading = ReminderRepository.instance.read(reminderId) {
            self.reminder = reminderFromReading
        }
    }
    
    func toggleStep(for step: Reminder.Step) {
        reminder.toggleStep(for: step)
    }
    
    func toggleExpanded(for step: Reminder.Step) {
        reminder.toggleExpanded(for: step)
    }
    
    func toggleFinish() {
        reminder.toggleFinish()
    }
}
