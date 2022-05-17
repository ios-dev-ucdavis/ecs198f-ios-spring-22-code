import SwiftUI


struct InspirationView: View {
    @Binding var isShow: Bool
    @State var showMore: Bool = false
    
    var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
    
    var topBar: some View {
        HStack {
            Button {
                showMore.toggle()
            } label: {
                Image(systemName: showMore ? "chevron.down" : "chevron.up")
            }
            .font(.body)
            
            Spacer()
            
            Text("Inspiration")
                .font(.title)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button {
                withAnimation(.bouncyAnimation) {
                    isShow = false
                }
            } label: {
                Image(systemName: "xmark.circle")
            }
            .font(.body)
        }
        .padding(.horizontal)
        .padding(.top, 10)
        .padding(.bottom, 5)
    }
    
    var backdropLayer: some View {
        Color.black
            .opacity(0.2)
            .ignoresSafeArea()
            .transition(.opacity)
            .onTapGesture {
                withAnimation(.bouncyAnimation) {
                    isShow = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            if isShow {
                backdropLayer
                
                GeometryReader { geoProxy in
                    VStack {
                        Spacer()
                        
                        VStack {
                            topBar
                            
                            ImageGalleryView()
                            
                            Spacer()
                                .frame(height: geoProxy.safeAreaInsets.bottom)
                        }
                        .background(.ultraThinMaterial)
                        .frame(height: showMore ? nil : screenSize.height / 2)
                        .cornerRadius(15)
                        .animation(.bouncyAnimation, value: showMore)
                    }
                    .ignoresSafeArea(edges: .bottom)
                }
                .transition(.drawViewOutTransition)
                .zIndex(1)
            }
        }
    }
}
