//
//  DiscountLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Combine
import Foundation

class DiscountLoader: Loader {
    
    @Published var object: Discount?
    @Published var error: IdentifiableError?
    
    /// The endpoint for the loader
    private let endpoint = "getDiscount"
    
    /// A Combine cancellable
    private var cancellable: AnyCancellable?
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    func loadPlaceholderIfAvailable(for key: UUID) -> Bool {
        guard Placeholders.discounts.map(\.id).contains(key) else { return false }
        object = Placeholders.discounts.first { $0.id == key }
        return object != nil
    }
    
    func createRequest(for key: UUID) -> URLRequest {
        let body = IDRequest(id: key)
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpBody = body.encoded()
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
    
    func storeCancellable(_ cancellable: AnyCancellable) {
        self.cancellable = cancellable
    }
    
    /// Cancels any ongoing requests
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}
