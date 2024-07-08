import Foundation
import Alamofire

enum CatAPIRouter: APIRouter {
    case getCats(tags: [String]?, skip: Int, limit: Int)

    var method: HTTPMethod {
        switch self {
        case .getCats:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getCats:
            return "/api/cats"
        }
    }

    var queryParams: [String: AnyHashable]? {
        switch self {
        case .getCats(let tags, let skip, let limit):
            var query: [String: AnyHashable] = [
                "skip": skip,
                "limit": limit
            ]
            if let tags = tags {
                query["tags"] = tags.joined(separator: ",")
            }

            return query
        }
    }
}
