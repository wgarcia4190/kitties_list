import Foundation
import Alamofire

/// `BaseApi` holds the Alamofire `Session` responsible for making API requests.
class BaseAPI {
    let sessionManager: Session
    let configuration = URLSessionConfiguration.af.default
    
    let urlCache = URLCache(
        memoryCapacity: 500 * 1024 * 1024,
        diskCapacity: 500 * 1024 * 1024
    )

    init() {
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = urlCache
        
        let responseCacher = ResponseCacher(behavior: .modify { _, response in
          let userInfo = ["date": Date()]
          return CachedURLResponse(
            response: response.response,
            data: response.data,
            userInfo: userInfo,
            storagePolicy: .allowed)
        })
        
        self.sessionManager = Session(
            configuration: configuration,
            cachedResponseHandler: responseCacher,
            eventMonitors: [NetworkLogger()]
        )
    }
}
