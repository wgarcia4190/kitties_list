import Foundation
import SwiftData

struct CatModel: Codable {
    var id: String
    var tags: [String]
    
    init(id: String, tags: [String]) {
        self.id = id
        self.tags = tags
    }

    func getImageUrl(width: Int?, height: Int?) -> URL {
        if let width = width, width > 0, let height = height, height > 0 {
            return URL(string: "\(Constants.Api.BaseUrl)/cat/\(id)?height=\(height)&width=\(width)")!
        } else if let width = width, width > 0 {
            return URL(string: "\(Constants.Api.BaseUrl)/cat/\(id)?width=\(width)")!
        } else if let height = height, height > 0 {
            return URL(string: "\(Constants.Api.BaseUrl)/cat/\(id)?height=\(height)")!
        } else {
            return URL(string: "\(Constants.Api.BaseUrl)/cat/\(id)")!
        }
    }

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case tags
    }
}
