//
//  PostLoader.swift
//  Frontend
//

import Combine
import Foundation

/// A loader that loads a post
class PostLoader: Loader {
    
    /// The loaded post
    @Published var object: Post?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getPost"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    /// Loads content from placeholders if the ID represents a placeholder
    /// - Parameter id: The ID of the post
    /// - Returns: Whether it was loaded from placeholders
    func loadPlaceholderIfAvailable(for id: ID) -> Bool {
        guard Placeholders.posts.map(\.id).contains(id) else { return false }
        object = Placeholders.posts.first { $0.id == id }
        return object != nil
    }
    
    /// Creates a URL loading request for a post ID
    /// - Parameter id: The ID of the post
    /// - Returns: A URL request
    func createRequest(for id: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: id)
        return .postRequest(url: url, body: body)
    }
}
