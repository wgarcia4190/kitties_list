import Foundation

enum APIError: BaseError {
    case errorGettingCats

    var title: String? {
        switch self {
        case .errorGettingCats:
            return "There was a problem getting kitties. Please try again."
        }
    }

    var message: String? {
        switch self {
        case .errorGettingCats:
            return "There was a problem getting kitties. Please try again."
        }
    }
}
