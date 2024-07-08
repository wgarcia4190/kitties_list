import Foundation
import SwiftData

@Model
final class CatItem {
    var id: String
    var tags: [String]
    
    init(id: String, tags: [String]) {
        self.id = id
        self.tags = tags
    }
    
    func toModel() -> CatModel {
        return CatModel(id: id, tags: tags)
    }
}
