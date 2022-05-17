import Foundation

struct ImageGallery: Decodable, Identifiable {
    let id: String
    let urls: Urls
}

struct Urls: Decodable {
    let raw, full, regular, small, thumb: String
}

typealias Images = [ImageGallery]
