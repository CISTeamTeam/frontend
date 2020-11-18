//
//  AllDiscountsLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Combine
import Foundation

class AllDiscountsLoader: Loader {
    
    @Published var object: [UUID]?
    @Published var error: IdentifiableError?
    
    /// The endpoint for the loader
    private let endpoint = "getDiscounts"
    
    /// A Combine cancellable
    private var cancellable: AnyCancellable?
    
    required init() {
        load(key: true)
    }
    
    deinit {
        cancel()
    }
    
    func loadPlaceholderIfAvailable(for key: Bool) -> Bool {
        guard key else { return false }
        object = Placeholders.discounts.map(\.id)
        return true
    }
    
    func createRequest(for key: Bool) -> URLRequest {
        let body = EmptyRequest()
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
    
    // MARK: - Singleton
    
    static let main = AllDiscountsLoader()
}
