//
//  Loadable.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

/// A `View` that loads content using a `Loader`
protocol Loadable: View {
    associatedtype Content: View
    associatedtype Loader: Frontend.Loader
    associatedtype Value
    
    typealias LoaderView = Load<Loader, Value, Content>?
    
    /// The key identifying the object to load
    var key: Loader.Key { get }
    
    /// The loader to use to load content
    var loader: Loader { get }
    
    /// Creates a view using loaded content
    /// - Parameter value: Loaded content
    func body(with value: Value) -> Content
}

extension Loadable {
    var body: some View {
        Load(with: loader, key: key, content: body)
    }
}
