//
//  GroupCardView.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 3/31/22.
//

import SwiftUI

struct GroupCardView: View {
    var groupName = "New Group"
    @State var groupLabelColor: Color = .blue
    var hstackSpacing: CGFloat = 0
    
    var body: some View {
        HStack(spacing: hstackSpacing) {
            groupLabelColor
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
                        self.groupLabelColor = (self.groupLabelColor == .blue) ? .green : .blue
                    }
                    
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct GroupCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GroupCardView()
                .frame(width: 200, height: 150)
            
            GroupCardView()
                .frame(width: 300, height: 150)
            
            GroupCardView(groupLabelColor: Color.red)
                .frame(width: 200, height: 150)
            
            GroupCardView(groupName: "ECS 198F")
                .frame(width: 150, height: 150)
        }
//        GroupCardView()
//            .frame(width: 200, height: 150)
//            .border(Color.red, width: 2)
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
