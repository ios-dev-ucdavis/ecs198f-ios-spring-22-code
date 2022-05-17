import SwiftUI

struct GroupView: View {
    @StateObject var actionButtonVM = ActionButtonViewModel()
    @StateObject var rootReminderGroupsVM = RootRepositoryViewModel()
    @EnvironmentObject var settingsVM: SettingsViewModel
    
    @State var isInspirationShow: Bool = false
    @State var weatherIconStr: String = "thermometer"
    
    var reminderGroups: [ReminderGroup] {
        rootReminderGroupsVM.allGroups
    }
    
    private var columns: [GridItem] {
        [
            GridItem(.flexible(minimum: 80), spacing: 15, alignment: .top),
            GridItem(.flexible(minimum: 80), spacing: 15, alignment: .top)
        ]
    }
    
    var mainBody: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(reminderGroups) { group in
                    let reminderGroupVM = ReminderGroupViewModel(group.id)
                    NavigationLink {
                        ReminderView(reminderGroupVM)
                    } label: {
                        GroupCardView(reminderGroupVM)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal)
        }
        .background(Color.secondarySystemBackground)
        .navigationTitle(settingsVM.welcomeGreetings)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.bouncyAnimation) {
                        isInspirationShow.toggle()
                    }
                } label: {
                    Group {
                        if isInspirationShow {
                            Image(systemName: "lightbulb.fill")
                                .foregroundColor(.accentColor)
                        } else {
                            Image(systemName: "lightbulb")
                                .foregroundColor(.primary)
                        }
                    }
                    .font(.caption)
                    .transition(.opacity)
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                // Create a multi-color SF Symbol icon!
                Image(systemName: self.weatherIconStr)
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.primary, Color.accentColor)
                    .font(.caption)
            }
        }
        .onAppear {
            prepareMainViewActionButtonItems()
        }
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                mainBody
            }
            
            .navigationViewStyle(.stack)
            .ignoresSafeArea()
            .sheet(isPresented: $actionButtonVM.isSettingsOpen, content: {
                SettingsView()
            })
            .environmentObject(actionButtonVM)
            
            
            ActionButton(actionButtonVM)
            
            InspirationView(isShow: $isInspirationShow)
        }
        
    }
}

// Helper functions
extension GroupView {
    func prepareMainViewActionButtonItems() {
        actionButtonVM.setupActionButtonItems(with: [
            ActionButtonItem(labelName: "folder.badge.plus", {
                print("Add a Reminder Group.")
            })
        ])
//        actionButtonVM.setupActionButtonItems(with: [
//            ActionButtonItem(toggleReminderGroupCreationDrawer, labelName: "folder.badge.plus")
//        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
