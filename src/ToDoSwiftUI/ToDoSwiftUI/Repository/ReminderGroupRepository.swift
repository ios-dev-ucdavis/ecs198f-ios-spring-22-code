import Foundation

class ReminderGroupRepository: IORepository {
    static private var _repoInst: ReminderGroupRepository?
    
    static var instance: ReminderGroupRepository {
        if let instance = self._repoInst {
            return instance
        } else {
            self._repoInst = ReminderGroupRepository()
            return self._repoInst!
        }
    }
    
    private init() {}
    
    @discardableResult
    func create(_ item: ReminderGroup) -> ReminderGroup? {
        UserData.reminderGroups.append(item)
        return self.read(item.id)
    }
    
    @discardableResult
    func read(_ id: UUID) -> ReminderGroup? {
        return UserData.reminderGroups.first { $0.id == id }
    }
    
    @discardableResult
    func update(_ id: UUID, with newItem: ReminderGroup) -> ReminderGroup? {
        guard let oldReminderGroupIndex = UserData.reminderGroups.firstIndex(where: { $0.id == id }) else {
            return nil
        }
        
        UserData.reminderGroups[oldReminderGroupIndex] = newItem
        return self.read(newItem.id)
    }
    
    func delete(_ id: UUID) {
        guard let oldReminderGroupIndex = UserData.reminderGroups.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        UserData.reminderGroups.remove(at: oldReminderGroupIndex)
    }
}
