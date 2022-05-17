import Foundation

extension String: Identifiable {
    public var id: Int {
        self.hashValue
    }
}
