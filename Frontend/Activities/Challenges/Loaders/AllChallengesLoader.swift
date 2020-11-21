//
//  AllChallengesLoader.swift
//  Frontend
//

import Combine
import Foundation

/// A loader that loads all challenges
class AllChallengesLoader: Loader {
    
    /// A response for this loader
    struct Response: Codable {
        /// An array of challenge IDs
        let challenges: [ID]
    }
    
    /// The loaded challenge IDs
    @Published var object: Response?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getChallenges"
    
    required init() {
        load(key: false)
    }
    
    deinit {
        cancel()
    }
    
    /// Loads content from placeholders if the key is true
    /// - Parameter key: Whether to load from placeholders
    /// - Returns: Whether content was loaded from placeholders
    func loadPlaceholderIfAvailable(for key: Bool) -> Bool {
        guard key else { return false }
        object = Response(challenges: Placeholders.challenges.map(\.id))
        return true
    }
    
    /// Creates a URL request to load challenges
    /// - Parameter key: Ignored
    /// - Returns: A URL request
    func createRequest(for key: Bool) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = EmptyRequest()
        return .postRequest(url: url, body: body)
    }
    
    // MARK: - Singleton
    
    /// Shared loader
    static let main = AllChallengesLoader()
}
