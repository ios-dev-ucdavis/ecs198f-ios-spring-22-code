import Foundation
import SwiftUI

class ActionButtonViewModel: ObservableObject {
    @Published var isSettingsOpen = false
    
    @Published var actionButtonItems: [ActionButtonItem] = [
        ActionButtonItem(labelName: "folder.badge.plus", {
            print("folder.badge.plus")
        })
    ]
    
    init(_ actionButtonItems: [ActionButtonItem]) {
        self.actionButtonItems = actionButtonItems
    }
    
    init() {}
    
    var settingsActionButton: ActionButtonItem {
        ActionButtonItem(labelName: "gearshape") {
            self.isSettingsOpen.toggle()
        }
    }
    
    func setupActionButtonItems(with newItems: [ActionButtonItem]) {
        self.actionButtonItems = newItems
    }
    
    func addActionButtonItem(with newItem: ActionButtonItem) {
        self.actionButtonItems.append(newItem)
    }
}
