import Foundation

protocol IORepository {
    associatedtype Item where Item: Identifiable
    
    func create(_ item: Item) -> Item?
    func read(_ id: UUID) -> Item?
    func update(_ id: UUID, with newItem: Item) -> Item?
    func delete(_ id: UUID)
}
