//
//  CommentLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Combine
import Foundation

/// A loader that loads a comment
class CommentLoader: Loader {
    
    /// The loaded comment
    @Published var object: Comment?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getComment"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Loads content from placeholders if the ID represents a placeholder
    /// - Parameter id: The ID of the comment
    /// - Returns: Whether it was loaded from placeholders
    func loadPlaceholderIfAvailable(for id: ID) -> Bool {
        guard Placeholders.comments.map(\.id).contains(id) else { return false }
        object = Placeholders.comments.first { $0.id == id }
        return object != nil
    }
    
    /// Creates a URL loading request for a comment ID
    /// - Parameter id: The ID of the comment
    /// - Returns: A URL request
    func createRequest(for id: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: id)
        return .postRequest(url: url, body: body)
    }
}
