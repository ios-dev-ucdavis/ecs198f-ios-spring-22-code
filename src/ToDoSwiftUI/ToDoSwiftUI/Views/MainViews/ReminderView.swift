import SwiftUI

struct ReminderView: View {
    @EnvironmentObject var actionButtonVM: ActionButtonViewModel
    @ObservedObject var reminderGroupVM: ReminderGroupViewModel
    
    var groupName: String {
        self.reminderGroupVM.name
    }
    
    private var columns: [GridItem] {
        [
            GridItem(.flexible(minimum: 80), spacing: 15, alignment: .top),
            GridItem(.flexible(minimum: 80), spacing: 15, alignment: .top)
        ]
    }
    
    init(_ reminderGroupId: UUID) {
        self.reminderGroupVM = ReminderGroupViewModel(reminderGroupId)
    }
    
    init( _ reminderGroupVM: ReminderGroupViewModel) {
        self.reminderGroupVM = reminderGroupVM
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(reminderGroupVM.reminderIds, id: \.self) { reminderId in
                    let reminderVM = ReminderViewModel(reminderId, previewNum: 4)

                    NavigationLink {
                        DetailView(reminderVM)
                            .environmentObject(reminderGroupVM)
                    } label: {
                        ReminderCardView(reminderVM)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .background(Color.secondarySystemBackground)
        .navigationTitle(groupName)
        .onAppear {
            prepareReminerViewActionButtonItems()
        }
    }
}

extension ReminderView {
    func prepareReminerViewActionButtonItems() {
        actionButtonVM.setupActionButtonItems(with: [
            ActionButtonItem(labelName: "note.text.badge.plus", {
                print("Add a Reminder.")
            })
        ])
    }
}

struct ReminderView_Previews: PreviewProvider {
    static let reminderGroupId: UUID = {
        UserData.reminderGroups = UserData.randomGenerateGroups()
        return UserData.reminderGroups.first!.id
    }()
    
    static var previews: some View {
        Group {
            ReminderView(reminderGroupId)
            ReminderView(reminderGroupId)
                .environment(\.colorScheme, .dark)
                .environment(\.font, .title)
                
        }
    }
}
