import SwiftUI

struct ActionButtonItem: View, Identifiable, Equatable {
    static func == (lhs: ActionButtonItem, rhs: ActionButtonItem) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: Int {
        labelName.hashValue
    }
    
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
        .transition(.scale)
    }
}

struct ActionButtonFlyoutPanel: View {
    @EnvironmentObject var actionButtonVM: ActionButtonViewModel
    @Binding var showMore: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(actionButtonVM.actionButtonItems) { item in
                item
            }
            
            actionButtonVM.settingsActionButton
        }
        .foregroundColor(.white)
        .padding()
        .frame(height: 55)
        .background(.blue)
        .cornerRadius(20)
    }
}

struct ActionButton: View {
    @ObservedObject var actionButtonVM: ActionButtonViewModel
    @State private var showMore = false
    
    init(_ actionButtonVM: ActionButtonViewModel) {
        self.actionButtonVM = actionButtonVM
    }
    
    @ViewBuilder
    var mainBody: some View {
        if showMore {
            ActionButtonFlyoutPanel(showMore: $showMore)
                .transition(.floatingMenuPopup)
                .environmentObject(actionButtonVM)
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
        .animation(.default, value: actionButtonVM.actionButtonItems)
        .shadow(radius: 4)
        .font(.system(size: 22))
        .padding()
    }
}

struct ActionButton_Previews: PreviewProvider {
    static let vm = ActionButtonViewModel()
    
    static var previews: some View {
        ActionButton(vm)
        
        ActionButtonFlyoutPanel(showMore: .constant(true))
            .environmentObject(vm)
    }
}
