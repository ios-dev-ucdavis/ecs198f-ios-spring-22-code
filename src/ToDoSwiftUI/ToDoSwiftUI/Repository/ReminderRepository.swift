import Foundation

class ReminderRepository: IORepository {
    static private var _repoInst: ReminderRepository?
    
    static var instance: ReminderRepository {
        if let instance = self._repoInst {
            return instance
        } else {
            self._repoInst = ReminderRepository()
            return self._repoInst!
        }
    }
    
    private init() {}
    
    @discardableResult
    func create(_ item: Reminder) -> Reminder? {
        UserData.reminders.append(item)
        return self.read(item.id)
    }
    
    @discardableResult
    func read(_ id: UUID) -> Reminder? {
        return UserData.reminders.first { $0.id == id }
    }
    
    @discardableResult
    func update(_ id: UUID, with newItem: Reminder) -> Reminder? {
        guard let oldReminderIndex = UserData.reminders.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        
        UserData.reminders[oldReminderIndex] = newItem
        return self.read(newItem.id)
    }
    
    func delete(_ id: UUID) {
        guard let oldReminderIndex = UserData.reminders.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        UserData.reminders.remove(at: oldReminderIndex)
    }
}
