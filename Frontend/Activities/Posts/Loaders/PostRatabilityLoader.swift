//
//  PostRatabilityLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Combine
import Foundation

/// A loader that checks whether a post can be rated
class PostRatabilityLoader: Loader {
    
    /// Whether the post can be rated
    @Published var object: StatusResponse?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "canRatePost"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Not applicable for this loader
    func loadPlaceholderIfAvailable(for request: IDRequest) -> Bool {
        false
    }
    
    /// Creates a URL loading request for post ratability
    /// - Parameter request: An ID request
    /// - Returns: A URL request
    func createRequest(for request: IDRequest) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        return .postRequest(url: url, body: request)
    }
}
