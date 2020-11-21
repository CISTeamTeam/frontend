//
//  UserLoader.swift
//  Frontend
//

import Combine
import Foundation

/// A loader that loads a user
class UserLoader: Loader {
    
    /// The loaded user
    @Published var object: User?
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the loader
    private let endpoint = "getUser"
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Loads content from placeholders if the ID represents a placeholder
    /// - Parameter id: The ID of the user
    /// - Returns: Whether it was loaded from placeholders
    func loadPlaceholderIfAvailable(for id: ID) -> Bool {
        guard Placeholders.users.map(\.id).contains(id) else { return false }
        object = Placeholders.users.first { $0.id == id }
        return object != nil
    }
    
    /// Creates a URL request to load the user
    /// - Parameter id: The ID of the user
    /// - Returns: A URL request
    func createRequest(for id: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: id)
        return .postRequest(url: url, body: body)
    }
}

