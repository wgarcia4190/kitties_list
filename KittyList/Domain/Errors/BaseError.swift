import Foundation

protocol BaseError: LocalizedError {
    var title: String? { get }
    var message: String? { get }
}
