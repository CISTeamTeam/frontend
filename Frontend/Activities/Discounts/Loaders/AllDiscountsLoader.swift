//
//  AllDiscountsLoader.swift
//  Frontend
//

import Combine
import Foundation

/// A loader that loads all discounts
class AllDiscountsLoader: Loader {
    
    /// A response for this loader
    struct Response: Codable {
        /// An array of discount IDs
        let discounts: [ID]
    }
    
    /// The loaded discount IDs
    @Published var object: Response?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getDiscounts"
    
    required init() {
        load(key: false)
    }
    
    deinit {
        cancel()
    }
    
    /// Loads contentb from placeholders if the key is true
    /// - Parameter key: Whether to load from placeholders
    /// - Returns: Whether content was loaded from placeholders
    func loadPlaceholderIfAvailable(for key: Bool) -> Bool {
        guard key else { return false }
        object = Response(discounts: Placeholders.discounts.map(\.id))
        return true
    }
    
    /// Creates a URL request to load discounta
    /// - Parameter key: Ignored
    /// - Returns: A URL request
    func createRequest(for key: Bool) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = EmptyRequest()
        return .postRequest(url: url, body: body)
    }
    
    // MARK: - Singleton
    
    /// Shared loader
    static let main = AllDiscountsLoader()
}
