//
//  Load.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

/// A view that loads content using a `Loader` before displaying the content using a custom `View`
struct Load<Loader: Frontend.Loader, Value, Content: View>: View {
    
    /// The loader sub
    @ObservedObject private var loader: Loader

    /// The key identifying the object to load
    private let key: Loader.Key
    
    /// Builds a view using a loaded object
    private var contentBuilder: (Value) -> Content
    
    /// The loaded object, if it loaded
    private var value: Value? {
        loader.object as? Value
    }
    
    /// Creates a new `Load` view for a loader
    /// - Parameters:
    ///   - loader: A loader
    ///   - key: The key identifying the object to load
    ///   - contentBuilder: Builds a view using a loaded object
    init(with loader: Loader,
         key: Loader.Key,
         @ViewBuilder content contentBuilder: @escaping (Value) -> Content) {
        self.loader = loader
        self.key = key
        self.contentBuilder = contentBuilder
    }
    
    var body: some View {
        bodyContent
            .alert(errorBinding: $loader.error)
            .onAppear {
                loader.load(key: key)
            }
            .onDisappear {
                loader.cancel()
            }
    }
    
    @ViewBuilder private var bodyContent: some View {
        if let value = value {
            contentBuilder(value)
        } else {
            ProgressView()
        }
    }
}
