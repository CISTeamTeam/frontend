//
//  CommentPoster.swift
//  Frontend
//

import Combine
import Foundation

/// A poster that posts comments
class CommentPoster: Poster {
    
    /// Whether a request is currently in progress.
    @Published var isLoading = false
    
    /// An error, if one occurred.
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the poster
    private let endpoint = "postComment"
    
    init() { }
    
    deinit {
        cancel()
    }
    
    /// Creates a `URLRequest` used to post some content
    /// - Parameter comment: The comment to post
    /// - Returns: A URL request
    func createRequest(for comment: Comment) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        return .postRequest(url: url, body: comment)
    }
}
