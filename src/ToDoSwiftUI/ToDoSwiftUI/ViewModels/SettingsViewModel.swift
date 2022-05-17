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
    
    private let settingsFileKey = "SwiftUIToDoSettingsFile"
    
    init() { }
    
    func loadSettings() {
        
    }
    
    func saveSettings(with newSettings: Settings? = nil) {
        
    }
    
    func removeSettings() {
//        self.settings = Settings()
//        UserDefaults.standard.removeObject(forKey: self.settingsFileKey)
    }
}

extension SettingsViewModel {
    var welcomeGreetings: String {
        get {
            settings.welcomeGreetings
        }
        set {
            settings.welcomeGreetings = newValue
        }
    }
    
    var showProgressRing: Bool {
        get {
            settings.showProgressRing
        }
        set {
            settings.showProgressRing = newValue
        }
    }
    
    var showStepsPreview: Bool {
        get {
            settings.showStepsPreview
        }
        set {
            settings.showStepsPreview = newValue
        }
    }
    
    var maxNumOfStepsPreview: Int {
        get {
            settings.maxNumOfStepsPreview
        }
        set {
            settings.maxNumOfStepsPreview = newValue
        }
    }
}
