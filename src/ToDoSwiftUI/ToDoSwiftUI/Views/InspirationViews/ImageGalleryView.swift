import SwiftUI

struct ImageGalleryView: View {
    @StateObject var imageGalleryVM = ImageGalleryViewModel()
    
    var body: some View {
        ScrollView {
            editorialFeeds
            randomImages
        }
    }
    
    var randomImages: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Feeling Lucky?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .padding()
                Spacer()
            }
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
    
    var editorialFeeds: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Editorial Feeds")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                    .padding()
                Spacer()
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                    
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
    
//    @ViewBuilder
//    func imageBuilder(for image: ImageGallery) -> some View {
//        let imageUrl = URL(
//            string: image.urls.regular
//        )
//    }
}

struct ImageGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGalleryView()
    }
}
