//
//  PostRater.swift
//  Frontend
//

import Combine
import Foundation

/// A poster that rates posts
class PostRater: Poster {
    
    /// Whether a request is currently in progress.
    @Published var isLoading = false
    
    /// An error, if one occurred.
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the poster
    private let endpoint = "ratePost"
    
    init() { }
    
    deinit {
        cancel()
    }
    
    /// Creates a `URLRequest` used to rate a post
    /// - Parameter rating: The rating
    /// - Returns: A URL request
    func createRequest(for rating: PostRating) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        return .postRequest(url: url, body: rating)
    }
}
