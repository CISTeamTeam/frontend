//
//  Loader.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// A type that can load data from some source and throw errors
protocol Loader: ObservableObject, ThrowsErrors {
    associatedtype Key: Hashable
    associatedtype Object
    
    /// Creates a new instance of the loader
    init()
    
    /// The loaded object
    var object: Object? { get set }
    
    /// Loads data for a key. Do not call this method directly.
    /// - Parameter key: The key identifying the object
    func loadData(key: Key)
    
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
    
    /// Requests for the object for a key to be reloaded
    /// - Parameter key: The key identifying the object
    func reload(key: Key) {
        prepare()
        object = nil
        dismissError()
        load(key: key)
    }
}
