import Foundation
import Combine
import SwiftUI

class RootRepositoryViewModel: ObservableObject {
    private var cancellable: AnyCancellable?
    @Published var allGroups = [ReminderGroup]()
    
    @Published var isCreatingReminderGroup = false
    @Published var newGroup = ReminderGroup(name: "")
    
    @Published var isEditingReminderGroup = false
    @Published var reminderGroupForEdit = ReminderGroup()
    
    init() {
        self.loadAllReminderGroups()
        self.cancellable = self.$allGroups
            .dropFirst()
            .sink { newGroups in
                UserData.reminderGroups = newGroups
            }
    }
    
    func loadAllReminderGroups() {
        self.allGroups = UserData.reminderGroups
    }
    
    func addReminderGroup(_ newReminderGroup: ReminderGroup) {
        self.allGroups.append(newReminderGroup)
    }
    
    func updateReminderGroup() {
        guard let index = allGroups.firstIndex(where: { $0.id == reminderGroupForEdit.id }) else {
            return
        }
        allGroups[index] = reminderGroupForEdit
    }
    
    func removeReminderGroup(with id: UUID) {
        guard let index = allGroups.firstIndex(where: { $0.id == id }) else {
            return
        }
        allGroups.remove(at: index)
    }
}
