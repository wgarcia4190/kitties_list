import Foundation
import Alamofire

protocol APIRouter: URLRequestConvertible {
    var baseUrl: URL { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameterEncoding: ParameterEncoding { get }
    var body: [String: Any]? { get }
    var queryParams: [String: AnyHashable]? { get }
    var timeout: TimeInterval { get }
    var headers: [String: String]? { get }
}

extension APIRouter {
    var baseUrl: URL {
        URL(string: Constants.Api.BaseUrl)!
    }

    var body: [String: Any]? {
        nil
    }

    var queryParams: [String: AnyHashable]? {
        nil
    }

    var timeout: TimeInterval {
        URLSessionConfiguration.default.timeoutIntervalForRequest
    }

    var headers: [String: String]? {
        nil
    }

    var isAuthenticated: Bool? {
        nil
    }

    var parameterEncoding: ParameterEncoding {
        JSONEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        
        var components = URLComponents(string: url.absoluteString)
        components?.queryItems = queryParams?.map { URLQueryItem(name: $0.key, value: $0.value.description) }

        var urlRequest = try URLRequest(url: components?.url ?? url, method: method)
        urlRequest.timeoutInterval = timeout

        headers?.forEach({ key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        })

        return try parameterEncoding.encode(urlRequest, with: body)
    }
}
