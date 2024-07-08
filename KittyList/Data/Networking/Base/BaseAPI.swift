import Foundation
import Alamofire

/// `BaseApi` holds the Alamofire `Session` responsible for making API requests.
class BaseAPI {
    let sessionManager: Session

    init(
        sessionManager: Session = Session(
            configuration: URLSessionConfiguration.af.default,
            eventMonitors: [NetworkLogger()]
        )
    ) {
        self.sessionManager = sessionManager
    }
}
