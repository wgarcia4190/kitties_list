import Foundation

struct Constants {
    struct Api {
        static var BaseUrl: String {
            return "https://cataas.com"
        }
    }
}

enum KittiesSelection: String, CaseIterable {
    case list = "Kitties"
    case favorites = "Favorites"
}
