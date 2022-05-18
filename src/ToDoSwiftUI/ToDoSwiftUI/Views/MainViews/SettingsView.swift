import SwiftUI

struct WelcomePageSettingsView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    var body: some View {
        Form {
            Section {
                TextField("Welcome Greetings",
                          text: $settingsVM.welcomeGreetings,
                          prompt: Text("Welcome"))
            } header: {
                Text("Set Your Welcome Greetings")
            }
        }
        .navigationTitle("Welcome Page")
    }
}

struct ReminderPageSettingsView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    let numOfStepsPreviewRange = 1...5
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $settingsVM.showProgressRing) {
                    Text("Show Progress Ring")
                }
                VStack {
                    Toggle(isOn: $settingsVM.showStepsPreview) {
                        Text("Show Steps Preview")
                    }
                    
                    if settingsVM.showStepsPreview {
                        Stepper(value: $settingsVM.maxNumOfStepsPreview,
                                in: numOfStepsPreviewRange,
                                step: 1) {
                            Text("Show \(settingsVM.maxNumOfStepsPreview) Steps Preview")
                        }
                    }
                }
            } header: {
                Text("Customize Display for Reminder Page")
            }
        }
        .navigationTitle("Reminder Page")
    }
}


struct SettingsView: View {
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        NavigationLink("Welcome Page") {
                            WelcomePageSettingsView()
                        }
                        NavigationLink("Reminder Page") {
                            ReminderPageSettingsView()
                        }
                    } header: {
                        Label("General", systemImage: "gearshape")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(SettingsViewModel())
    }
}
