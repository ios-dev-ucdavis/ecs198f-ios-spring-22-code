//
//  SettingsViewModel.swift
//  ToDo
//
//  Created by Yibo Yan on 10/20/21.
//

import Foundation
import Combine
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var settings = Settings()
//    @AppStorage("showStepsPreview") var showStepsPreview = false
    
    private let settingsFileKey = "SwiftUIToDoSettingsFile"
    
    init() {
        loadSettings()
    }
    
    func loadSettings() {
        let settingsJson = UserDefaults.standard.object(forKey: settingsFileKey) as? Data
        self.settings = Settings(json: settingsJson) ?? Settings()
    }
    
    func saveSettings(with newSettings: Settings? = nil) {
        if let newSettings = newSettings {
            UserDefaults.standard.set(newSettings.json, forKey: settingsFileKey)
        } else {
            UserDefaults.standard.set(self.settings.json, forKey: settingsFileKey)
        }
    }
    
    func removeSettings() {
        self.settings = Settings()
        UserDefaults.standard.removeObject(forKey: self.settingsFileKey)
    }
}

extension SettingsViewModel {
    var welcomeGreetings: String {
        get {
            settings.welcomeGreetings
        }
        set {
            settings.welcomeGreetings = newValue
            saveSettings()
        }
    }
    
    var showProgressRing: Bool {
        get {
            settings.showProgressRing
        }
        set {
            settings.showProgressRing = newValue
            saveSettings()
        }
    }
    
    var showStepsPreview: Bool {
        get {
            settings.showStepsPreview
        }
        set {
            settings.showStepsPreview = newValue
            saveSettings()
        }
    }
    
    var maxNumOfStepsPreview: Int {
        get {
            settings.maxNumOfStepsPreview
        }
        set {
            settings.maxNumOfStepsPreview = newValue
            saveSettings()
        }
    }
}
