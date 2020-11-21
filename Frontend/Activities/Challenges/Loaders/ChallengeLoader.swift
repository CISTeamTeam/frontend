//
//  CommentLoader.swift
//  Frontend
//

import Combine
import Foundation

/// A loader that loads challenges
class ChallengeLoader: Loader {
    
    /// The loaded challenge
    @Published var object: Challenge?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getChallenge"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Loads content from placeholders if the ID represents a placeholder
    /// - Parameter id: THe ID of the challenge
    /// - Returns: Whether it was loaded from placeholders
    func loadPlaceholderIfAvailable(for id: ID) -> Bool {
        guard Placeholders.challenges.map(\.id).contains(id) else { return false }
        object = Placeholders.challenges.first { $0.id == id }
        return object != nil
    }
    
    /// Creates a URL request for a challenge
    /// - Parameter id: The ID of the challenge
    /// - Returns: A URL request
    func createRequest(for id: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: id)
        return .postRequest(url: url, body: body)
    }
}
