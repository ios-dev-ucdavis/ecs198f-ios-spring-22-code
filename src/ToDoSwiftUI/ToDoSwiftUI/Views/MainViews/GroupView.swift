import SwiftUI

struct GroupView: View {
    @StateObject var rootReminderGroupsVM = RootRepositoryViewModel()
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
    
    var body: some View {
        ZStack {
            NavigationView {
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
                .navigationTitle("Welcome")
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
                        Image(systemName: self.weatherIconStr)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.primary, Color.accentColor)
                            .font(.caption)
                    }
                }
            }
            .navigationViewStyle(.stack)
            
            InspirationView(isShow: $isInspirationShow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
