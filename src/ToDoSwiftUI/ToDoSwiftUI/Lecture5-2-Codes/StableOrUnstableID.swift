import SwiftUI

struct StableIDDemoStruct: Identifiable, Equatable {
    var num: Int
    
    // Unstable
    var id: UUID {
        UUID()
    }
}

class StableIDDemoVM: ObservableObject {
    @Published var myStructs = [StableIDDemoStruct]()
    
    func loadData() {
        myStructs.removeAll()
        for num in 0...4 {
            myStructs.append(
                StableIDDemoStruct(num: num)
            )
        }
    }
    
    func addOne() {
        myStructs.append(
            StableIDDemoStruct(num: myStructs.count)
        )
    }
}

struct StableIDDemoView: View {
    @ObservedObject var stableIDVM = StableIDDemoVM()
    
    var body: some View {
        VStack {
            List(stableIDVM.myStructs) { myStruct in
                Text("Num \(myStruct.num)")
            }
            .animation(.default, value: stableIDVM.myStructs)

            Button("Reload Data") {
                stableIDVM.addOne()
            }
        }
        .onAppear {
            stableIDVM.loadData()
        }
    }
}

struct StableOrUnstableID_Previews: PreviewProvider {
    static var previews: some View {
        StableIDDemoView()
    }
}
