import SwiftUI

struct ReminderCardView: View {
    @ObservedObject private var reminderVM: ReminderViewModel
    
    private var reminder: Reminder {
        reminderVM.reminder
    }
    
    private var title: String {
        reminder.title
    }
    
    private var steps: [Reminder.Step] {
        reminder.steps
    }
    
    private var stepProgress: Double {
        reminderVM.stepProgress
    }
    
    init(_ reminder: Reminder) {
        self.reminderVM = ReminderViewModel(reminder: reminder)
    }
    
    init(_ reminderVM: ReminderViewModel) {
        self.reminderVM = reminderVM
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .top) {
                    Text(reminder.title)
                        .font(.headline)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.accentColor)
                    
                    Spacer()
                    
                    completionMarker
                }
                
                Group {
                    if reminder.steps.isEmpty {
                        Text("No steps for this reminder.")
                    } else {
                        HStack(spacing: 5) {
                            Text("\(reminder.steps.filter{$0.finished}.count)/\(reminder.steps.count)")
                            Text("steps finished")
                        }
                    }
                }
                .padding(.top, 2)
                .multilineTextAlignment(.leading)
                .font(.caption)
                .foregroundColor(.gray)
                
            }
            
            allSteps
        }
        .padding()
        .cornerRadius(viewConstant.cardCornerRadius)
        .background(
            conditionalBackground()
        )
        .progressable(
            cardCornerRadius: viewConstant.cardCornerRadius,
            strokeWidth: viewConstant.strokeWidth,
            stepProgress: self.stepProgress,
            show: true
        )
        .scaleEffect(reminder.finished ? 0.95 : 1)
        .animation(.default, value: reminder.finished)
    }
    
    var completionMarker: some View {
        Group {
            if reminder.finished {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .foregroundColor(.green)
            } else {
                Image(systemName: "circle.dashed")
                    .resizable()
                    .foregroundColor(.gray)
            }
        }
        .frame(
            width: viewConstant.completeIconSize.width,
            height: viewConstant.completeIconSize.height
        )
        .onTapGesture {
            // TODO: VM
            reminderVM.toggleFinish()
            //            reminder.toggleFinish()
        }
    }
    
    @ViewBuilder var allSteps: some View {
        if !self.steps.isEmpty {
            VStack {
                ForEach(self.steps) { step in
                    stepEntryBuilder(with: step)
                        .onTapGesture {
                            // TODO: VM
                            reminderVM.toggleStep(for: step)
                            //                            reminder.toggleStep(for: step)
                        }
                }
            }
            .padding(.top, 1)
        }
    }
    
    @ViewBuilder
    private func conditionalBackground() -> some View {
        if reminder.finished {
            Color.gray.opacity(0.1)
                .cornerRadius(viewConstant.cardCornerRadius)
        }
        
        Color.systemBackground
            .cornerRadius(viewConstant.cardCornerRadius)
            .shadow(color: .cyan.opacity(0.6), radius: 4)
            .opacity(reminder.finished ? 0 : 1)
    }
    
    private func stepEntryBuilder(with step: Reminder.Step) -> some View {
        HStack {
            Group {
                if !step.finished {
                    Image(systemName: "circle")
                } else {
                    Image(systemName: "circle.inset.filled")
                }
            }
            .font(.caption)
            
            Text(step.content)
                .strikethrough(step.finished)
            Spacer()
        }
        .foregroundColor(.primary.opacity(step.finished ? 0.5 : 1))
    }
}

extension ReminderCardView {
    private struct viewConstant {
        static let strokeWidth: CGFloat = 4
        static let cardCornerRadius: CGFloat = 14
        static let completeIconSize: CGSize = CGSize(width: 18, height: 18)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            let reminder = Reminder(
                steps: [
                    .init(id: 0, content: "Step 1"),
                    .init(id: 1, content: "Step 2")
                ],
                title: "This is demo reminder",
                note: "Some Notes here")
            
            ReminderCardView(reminder)
                .frame(maxWidth: 180, maxHeight: 150)
        }
        
        Group {
            let reminder = Reminder(
                steps: [],
                title: "This is demo empty reminder",
                note: "Some Notes here")
            
            ReminderCardView(reminder)
                .frame(maxWidth: 180, maxHeight: 150)
        }
        
        Group {
            let reminder: Reminder = {
                var createdReminder = Reminder(
                    steps: [],
                    title: "This is demo empty finished reminder",
                    note: "Some Notes here"
                )
                createdReminder.finished = true
                return createdReminder
            }()
            
            ReminderCardView(reminder)
                .frame(maxWidth: 180, maxHeight: 150)
        }
    }
}
