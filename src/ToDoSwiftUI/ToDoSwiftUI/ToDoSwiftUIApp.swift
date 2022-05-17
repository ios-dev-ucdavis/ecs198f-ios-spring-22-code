//
//  ToDoSwiftUIApp.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 3/29/22.
//

import SwiftUI

@main
struct ToDoSwiftUIApp: App {
    @StateObject var settingsVM = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            GroupView()
                .environmentObject(settingsVM)
        }
    }
}
