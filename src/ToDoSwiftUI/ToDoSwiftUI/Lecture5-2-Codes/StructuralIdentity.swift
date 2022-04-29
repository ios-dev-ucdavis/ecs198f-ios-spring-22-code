import SwiftUI

struct StructuralIdentityRight: View {
    @State var atTop = true
    
    var body: some View {
        VStack {
            Image(systemName: "face.smiling")
                .frame(
                    maxHeight: .infinity,
                    alignment: atTop ? .top : .bottom
                )
                .animation(.default, value: atTop)
            
            Button("Toggle") {
                atTop.toggle()
            }
        }
        .font(.title)
    }
}

struct StructuralIdentityWrong: View {
    @State var atTop = true
    
    var body: some View {
        VStack {
            if atTop {
                Image(systemName: "face.smiling")
                Spacer()
            } else {
                Spacer()
                Image(systemName: "face.smiling")
            }
            
            Button("Toggle") {
                atTop.toggle()
            }
        }
        .font(.title)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        StructuralIdentityWrong()
            .previewDisplayName("You shouldn't do this way.")
        
        StructuralIdentityRight()
            .previewDisplayName("You should do this way.")
    }
}
