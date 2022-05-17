import Foundation

class ImageGalleryViewModel: ObservableObject {
    @Published var editorialImages: Images = []
    @Published var randomImages: Images = []
    
    func loadEditorialImages() async {
        if Task.isCancelled {
            return
        }
        
        guard let results = await ImageGalleryAPIService.getEditorialImages() else {
            return
        }
        
        if !Task.isCancelled {
            await MainActor.run {
                editorialImages = results
            }
        }
    }
    
    func loadRandomImages() async {
        
    }
}
