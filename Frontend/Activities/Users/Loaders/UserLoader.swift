//
//  UserLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Combine
import Foundation

class UserLoader: Loader {
    
    @Published var object: User?
    @Published var error: IdentifiableError?
    
    /// The endpoint for the loader
    private let endpoint = "getUser"
    
    /// A Combine cancellable
    private var cancellable: AnyCancellable?
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    func loadPlaceholderIfAvailable(for key: ID) -> Bool {
        guard Placeholders.users.map(\.id).contains(key) else { return false }
        object = Placeholders.users.first { $0.id == key }
        return object != nil
    }
    
    func createRequest(for key: ID) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let body = IDRequest(id: key)
        print(url, body)
        return .postRequest(url: url, body: body)
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

