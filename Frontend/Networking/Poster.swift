//
//  Poster.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import Combine
import Foundation

/// A type that posts data and can throw errors
protocol Poster: ObservableObject, ThrowsErrors {
    associatedtype Content: Encodable & Hashable
    
    /// Whether a request is currently in progress. Must be annotated with a publisher property wrapper, such as `@State` or `@Published`, to work.
    var isLoading: Bool { get set }
    
    /// An ongoing request
    var cancellable: AnyCancellable? { get set }
    
    /// Creates a `URLRequest` used to post some content
    func createRequest(for content: Content) -> URLRequest
}

extension Poster {
    /// Posts some content.
    /// - Parameter content: The content to post
    func post(_ content: Content) {
        isLoading = true
        let request = createRequest(for: content)
        cancellable = URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: StatusResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case .finished = completion {
                    self?.isLoading = false
                }
                self?.catchCompletionError(completion)
            } receiveValue: { [weak self] status in
                switch status.status {
                case .success:
                    return
                case .failure:
                    self?.catchError(Errors.unknown)
                }
            }
    }
    
    /// Cancels any ongoing requests
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
}


