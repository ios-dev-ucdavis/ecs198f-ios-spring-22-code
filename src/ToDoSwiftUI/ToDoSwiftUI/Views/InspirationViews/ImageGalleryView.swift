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
                    ForEach(imageGalleryVM.randomImages) { image in
                        imageBuilder(for: image)
                            .frame(maxHeight: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
        .task {
            await imageGalleryVM.loadRandomImages()
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
                    ForEach(imageGalleryVM.editorialImages) { image in
                        imageBuilder(for: image)
                            .frame(height: 200)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10)
                            )
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
        .task {
            await imageGalleryVM.loadEditorialImages()
        }
    }
    
    @ViewBuilder
    func imageBuilder(for image: ImageGallery) -> some View {
        let imageUrl = URL(
            string: image.urls.regular
        )
        
        AsyncImage(url: imageUrl) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if phase.error != nil {
                Text("Failed to load.")
                    .expand()
                    .padding()
                    .background(Color.secondarySystemBackground)
            } else {
                Text("Loading...")
                    .expand()
                    .padding()
                    .background(Color.secondarySystemBackground)
            }
        }
    }
}

struct ImageGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGalleryView()
    }
}
