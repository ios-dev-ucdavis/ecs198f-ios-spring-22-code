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
    
    static func getEditorialImages() async -> Images? {
        await fetchResult(from: endpointQuery)
    }
    
    static func getRandomImages() async -> Images? {
        await fetchResult(from: randomEndpointQuery)
    }
    
    static func fetchResult(from endpoint: String) async -> Images? {
        guard let validEndpoint = URL(string: endpoint) else {
            print("Invalid URL.")
            return nil
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: validEndpoint) else {
            print("Failed to get images.")
            return nil
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(Images.self, from: data)
        } catch {
            print(error)
        }
        
        return nil
    }
}
