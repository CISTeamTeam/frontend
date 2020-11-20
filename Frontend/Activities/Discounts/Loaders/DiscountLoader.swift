//
//  DiscountLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Combine
import Foundation

/// A loader that loads a discount
class DiscountLoader: Loader {
    
    /// The loaded discount
    @Published var object: Discount?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getDiscount"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Loads content from placeholders if the ID represents a placeholder
    /// - Parameter id: The ID of the discount
    /// - Returns: Whether it was loaded from placeholders
    func loadPlaceholderIfAvailable(for id: ID) -> Bool {
        guard Placeholders.discounts.map(\.id).contains(id) else { return false }
        object = Placeholders.discounts.first { $0.id == id }
        return object != nil
    }
    
    /// Creates a URL request to load the discount
    /// - Parameter id: The ID of the discount
    /// - Returns: A URL request
    func createRequest(for id: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: id)
        return .postRequest(url: url, body: body)
    }
}
