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
    
    /// An ongoing request
    var cancellable: AnyCancellable? { get set }
    
    /// Creates a `URLRequest` for a network loading request
    func createRequest(for key: Key) -> URLRequest
    
    /// Loads placeholder data if the key matches a placeholder object, returning whether a placeholder was loaded.
    func loadPlaceholderIfAvailable(for key: Key) -> Bool
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
        print("->", request.url!.lastPathComponent, String(data: request.httpBody!, encoding: .utf8)!)
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: request)
            .retryIfNeeded()
            .map {
                print("<-", request.url!.lastPathComponent, String(data: $0, encoding: .utf8)!)
                return $0
            }
            .decode(type: Object.self, decoder: JSONDecoder.default)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if Object.self == User.self, case .failure = completion {
                    UserDefaults.standard.set(nil, forKey: Constants.signedInUserIDKey)
                }
                self?.catchCompletionError(completion)
            } receiveValue: { [weak self] object in
                self?.object = object
            }
    }
    
    /// Requests for the object for a key to be reloaded
    /// - Parameter key: The key identifying the object
    func reload(key: Key) {
        prepare()
        object = nil
        dismissError()
        load(key: key)
    }
    
    /// Cancels any ongoing requests
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}
