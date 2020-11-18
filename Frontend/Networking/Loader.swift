//
//  Loader.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Combine
import Foundation

/// A type that can load data from some source and throw errors
protocol Loader: ObservableObject, ThrowsErrors {
    associatedtype Key: Hashable
    associatedtype Object: Decodable
    
    /// Creates a new instance of the loader
    init()
    
    /// The loaded object
    var object: Object? { get set }
    
    /// Creates a `URLRequest` for a network loading request
    func createRequest(for key: Key) -> URLRequest
    
    /// Loads placeholder data if the key matches a placeholder object, returning whether a placeholder was loaded.
    func loadPlaceholderIfAvailable(for key: Key) -> Bool
    
    /// Stores a cancellable pipe from the Combine framework
    func storeCancellable(_ cancellable: AnyCancellable)
    
    /// Cancels any ongoing requests
    func cancel()
}

extension Loader {
    /// Prepares the loader to make a request
    func prepare() {
        cancel()
    }
    
    /// Requests the object for a key to be loaded
    /// - Parameter key: The key identifying the object
    func load(key: Key?) {
        guard let key = key else { return }
        prepare()
        loadData(key: key)
    }
    
    /// Loads data for a key. Do not call this method directly.
    /// - Parameter key: The key identifying the object
    func loadData(key: Key) {
        guard !loadPlaceholderIfAvailable(for: key) else { return }
        
        let request = createRequest(for: key)
        
        let cancellable = URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: Object.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { [weak self] object in
                self?.object = object
            }
        storeCancellable(cancellable)
    }
    
    /// Requests for the object for a key to be reloaded
    /// - Parameter key: The key identifying the object
    func reload(key: Key) {
        prepare()
        object = nil
        dismissError()
        load(key: key)
    }
}
