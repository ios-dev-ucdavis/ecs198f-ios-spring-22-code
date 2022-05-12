import Foundation
import SwiftUI

class ImageGalleryAPIService {
    static let endpoint = "https://api.unsplash.com"
    static let client_id = "CY5eXZNdb_uJhI9Xqo19kgfJ7yuGmvtrD-ea4lxHrd8"
    
    // MARK: Equivalent to
    // https://api.unsplash.com/photos/?client_id=CY5eXZNdb_uJhI9Xqo19kgfJ7yuGmvtrD-ea4lxHrd8
    static var endpointQuery: String {
        endpoint +
        "/photos" +
        "/?" +
        "client_id=\(client_id)"
    }
    
    // MARK: Equivalent to
    // https://api.unsplash.com/photos/random/?count=30&client_id=CY5eXZNdb_uJhI9Xqo19kgfJ7yuGmvtrD-ea4lxHrd8
    static var randomEndpointQuery: String {
        endpoint +
        "/photos/random" +
        "/?" +
        "count=\(30)" +
        "&client_id=\(client_id)"
    }
    
//    static func getEditorialImages() async -> Images? {
//        await fetchResult(from: endpointQuery)
//    }
//    
//    static func getRandomImages() async -> Images? {
//        await fetchResult(from: randomEndpointQuery)
//    }
//    
//    static func fetchResult(from endpoint: String) async -> Images? {
//        // TODO: Finish this.
//        return nil
//    }
}
