import Foundation

protocol CatAPIInterface {
    func getCats(tags: [String]?, skip: Int, limit: Int) async throws -> [CatModel]
}
