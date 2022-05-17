import SwiftUI

struct TaskRow: View {
    var step: Reminder.Step
    
    var body: some View {
        Text(step.content)
            .font(.system(size: 20))
    }
}

struct DetailView: View {
    @EnvironmentObject var reminderGroupVM: ReminderGroupViewModel
    @ObservedObject var reminderVM: ReminderViewModel
    
    var reminder: Reminder {
        reminderVM.reminder
    }
    
    var stepProgress: Double {
        reminderVM.stepProgress
    }
    
    init(_ reminderVM: ReminderViewModel) {
        self.reminderVM = reminderVM
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer().frame(height: 15)
                
                VStack {
                    ForEach(reminder.steps) { step in
                        HStack {
                            Image(systemName: step.finished
                                  ? "checkmark.circle.fill" : "circle.dashed")
                            .onTapGesture {
                                reminderVM.toggleStep(for: step)
                            }
                            
                            TaskRow(step: step)
                                .onTapGesture {
                                    reminderVM.toggleExpanded(for: step)
                                }
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(reminder.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondarySystemBackground)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                CircularProgressView(activeColor: .cyan, strokeWidth: 5, stepProgress: stepProgress)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    @ObservedObject static var vm = ReminderViewModel(UserData.reminders[0].id)
    
    static var previews: some View {
        DetailView(vm)
    }
}
