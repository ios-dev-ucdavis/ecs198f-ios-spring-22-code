//
//  ActionButton.swift
//  ToDoSwiftUI
//
//  Created by Yibo Yan on 4/21/22.
//

import SwiftUI

struct ActionButtonItem: View {
    var action: () -> Void
    var labelName: String
    
    init(labelName: String, _ action: @escaping () -> Void) {
        self.labelName = labelName
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: labelName)
        }
    }
}

struct ActionButtonFlyoutPanel: View {
    @Binding var showMore: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            ActionButtonItem(labelName: "folder.badge.plus") {
                print("Tapped on icon folder.badge.plus")
            }
            
            ActionButtonItem(labelName: "xmark") {
                withAnimation(.bouncyAnimation) {
                    showMore.toggle()
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .frame(height: 55)
        .background(.blue)
        .cornerRadius(20)
    }
}

struct ActionButton: View {
    @State var showMore = false
    
    @ViewBuilder
    var mainBody: some View {
        if showMore {
            ActionButtonFlyoutPanel(showMore: $showMore)
                .transition(.floatingMenuPopup)
        }
        
        Image(systemName: "plus")
            .foregroundColor(.white)
            .frame(width: 55, height: 55)
            .background(.blue)
            .clipShape(Circle())
            .rotationEffect(showMore ? .degrees(135) : .zero)
            .onTapGesture {
                withAnimation(.bouncyAnimation) {
                    showMore.toggle()
                }
            }
    }
    
    @ViewBuilder
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                mainBody
            }
        }
        .font(.system(size: 22))
        .padding()
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton()
        ActionButtonFlyoutPanel(showMore: .constant(true))
    }
}
