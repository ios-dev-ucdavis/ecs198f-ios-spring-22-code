import Foundation

struct Settings: Codable {
    var showProgressRing: Bool = true
    var showStepsPreview: Bool = true
    var maxNumOfStepsPreview: Int = 3
    var welcomeGreetings: String = "Welcome"
    
    var json: Data? {
        try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if let json = json,
           let settings = try? JSONDecoder().decode(Settings.self, from: json) {
            self = settings
        } else {
            return nil
        }
    }
    
    init() {}
}
