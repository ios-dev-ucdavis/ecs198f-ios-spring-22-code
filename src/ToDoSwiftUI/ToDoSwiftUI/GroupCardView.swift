//
//  GroupCardView.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 3/31/22.
//

import SwiftUI

struct GroupCardView: View {
    @State var reminderGroup = ReminderGroup(name: "Unamed Reminder Group")
//    var groupName = "New Group"
//    @State var groupLabelColor: Color = .blue
    var hstackSpacing: CGFloat = 0
    
    init(name: String) {
        self.reminderGroup = ReminderGroup(name: name)
    }
    
    init() {}
    
    var labelColor: Color {
        reminderGroup.labelColor
    }
    
    var groupName: String {
        reminderGroup.name
    }
    
    var body: some View {
        HStack(spacing: hstackSpacing) {
            labelColor
                .frame(width: 10)

            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "shippingbox")
                    Image(systemName: "calendar")
                    Image(systemName: "exclamationmark.2")
                        .foregroundColor(.red)
                }
                Text(groupName)
                    .fontWeight(.bold)

                Spacer()

                HStack {
                    Spacer()
                    
                    Button("Change Color") {
//                        if self.groupLabelColor == .blue {
//                            self.groupLabelColor = .green
//                        } else {
//                            self.groupLabelColor = .blue
//                        }
                        // Ternary operator
//                        self.groupLabelColor = (self.groupLabelColor == .blue) ? .green : .blue
                        self.reminderGroup.changeLabelColor(to: (self.labelColor == .blue) ? .green : .blue)
                    }
                    
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
        }
        .background(Color.systemBackground)
        .cornerRadius(10)
    }
}

struct GroupCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            GroupCardView()
                .frame(width: 200, height: 150)
        }
        .preferredColorScheme(.light)
//        .frame(maxWidth: .infinity)
//        .frame(maxHeight: .infinity)
        .modifier(Expand())
//        .expand()
        .background(.gray)
    }
}

//struct ViewModifier_Previews: PreviewProvider {
//    static var previews: some View {
//        Color.red
//            .frame(width: 50, height: 50)
//            .padding()
//            .background(.green)
//            .padding()
//            .background(.blue)
//            .border(.black, width: 2)
//    }
//}
