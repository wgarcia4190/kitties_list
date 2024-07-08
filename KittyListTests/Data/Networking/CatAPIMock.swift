import Foundation

@testable import KittyList

class CatAPIMock: CatAPIInterface {
    var getCatsCalled = false
    var getCatsError: Error?
    var getCatsResponse: [CatModel] = []

    func getCats(tags: [String]?, skip: Int, limit: Int) async throws -> [CatModel] {
        getCatsCalled = true

        if let error = getCatsError {
            throw error
        }
        return getCatsResponse
    }
}
