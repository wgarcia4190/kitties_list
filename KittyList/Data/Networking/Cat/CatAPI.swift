import Foundation
import Alamofire

class CatAPI: BaseAPI, CatAPIInterface {
    func getCats(tags: [String]?, skip: Int, limit: Int) async throws -> [CatModel] {
        let request = CatAPIRouter.getCats(tags: tags, skip: skip, limit: limit)
        let response = await sessionManager.request(request)
            .validate()
            .serializingDecodable([CatModel].self)
            .response

        switch response.result {
        case .success(let value):
            return value
        case .failure:
            throw APIError.errorGettingCats
        }
    }
}
