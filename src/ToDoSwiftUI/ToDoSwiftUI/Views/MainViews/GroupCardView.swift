import SwiftUI

struct GroupCardView: View {
    @ObservedObject var reminderGroupVM: ReminderGroupViewModel
    
    var groupColor: Color {
        reminderGroupVM.labelColor
    }
    
    var groupName: String {
        reminderGroupVM.name
    }
    
    var reminderNum: Int {
        reminderGroupVM.reminderIds.count
    }
    
    init(_ reminderGroupVM: ReminderGroupViewModel) {
        self.reminderGroupVM = reminderGroupVM
    }
    
    var body: some View {
        HStack(spacing: 0) {
            groupColor
                .frame(width: 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 2) {
                            Image(systemName: "shippingbox")
                            Image(systemName: "calendar")
                            Image(systemName: "exclamationmark.2")
                                .foregroundColor(.red)
                        }
                        .font(.caption)
                        
                        Text(groupName)
                            .fontWeight(.bold)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                            .truncationMode(.tail)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if reminderNum != 0 {
                        BadgeView(content: String(reminderNum))
                            .frame(width: 20, height: 20)
                    }
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color.gray)
                }
            }
            .padding()
        }
        .background(Color.systemBackground)
        .cornerRadius(14)
    }
}

//struct GroupCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ZStack {
//            GroupCardView()
//                .frame(width: 180, height: 120)
//        }
//        .expand()
//        .background(.gray)
//    }
//}
