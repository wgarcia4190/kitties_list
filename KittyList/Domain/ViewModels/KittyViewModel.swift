import Foundation
import SwiftUI

@MainActor
class KittyViewModel: ObservableObject {
    @Published var isLoading = false

    @Published var cats: [CatModel] = []
    @Published var error: Error?
    @Published var alert: BaseAlert?
    
    private let catApi: CatAPIInterface

    init(catApi: CatAPIInterface = CatAPI()) {
        self.catApi = catApi
    }

    func getCats(skip: Int, limit: Int) async {
        isLoading = true

        do {
            let nextCats = try await catApi.getCats(
                tags: nil,
                skip: skip,
                limit: limit
            )
            cats.append(contentsOf: nextCats)

            isLoading = false
        } catch {
            self.error = error
            
            handleError(error: error)
            isLoading = false
        }
    }
    
    @discardableResult
    private func handleError(error: Error) -> Bool {
        if let error = error as? BaseError {
            let action: Alert.Button = .default(Text("Ok"), action: { [weak self] in
                self?.alert = nil
                self?.error = nil
            })
            alert = BaseAlert(error: error, primaryAction: action)

            return true
        } else {
            return false
        }
    }
}
