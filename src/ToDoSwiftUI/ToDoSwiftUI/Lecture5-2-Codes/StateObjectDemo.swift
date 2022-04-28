import SwiftUI

class DemoVM: ObservableObject {
    @Published var num = 0
    
    func add() {
        num += 1
    }
}

struct StateObjectDemo: View {
    @State var num = 0
    
    var body: some View {
        VStack {
            Text("Num in ParentView: \(num)")
            Button("Add in ParentView") {
                num += 1
            }
            Divider()
            ChildView()
        }
    }
}

struct ChildView: View {
    @ObservedObject var vm = DemoVM()
    
    var body: some View {
        Text("Num in ChildView: \(vm.num)")
        Button("Add in ChildView") {
            vm.add()
        }
    }
}

struct StateObejectDemo_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectDemo()
    }
}
