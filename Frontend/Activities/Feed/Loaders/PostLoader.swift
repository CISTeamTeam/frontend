//
//  PostLoader.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Combine
import Foundation

class PostLoader: Loader {
    
    @Published var object: Post?
    @Published var error: IdentifiableError?
    
    /// The endpoint for the loader
    private let endpoint = "getPost"
    
    /// The JSON Decoder used to decode requests
    private let jsonDecoder = JSONDecoder()
    
    /// A Combine cancellable
    private var cancellable: AnyCancellable?
    
    required init() {
        
    }
    
    deinit {
        cancel()
    }
    
    /// Loads data for a key. Do not call this method directly.
    /// - Parameter key: The key identifying the object
    func loadData(key: UUID) {
        if key == Constants.placeholder {
            object = Post.placeholder
            return
        }
        
        let request = createRequest(for: key)
        
        cancellable = URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: Post.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { [weak self] post in
                self?.object = post
            }
    }
    
    /// Cancels any ongoing requests
    func cancel() {
        cancellable?.cancel()
        cancellable = nil
    }
    
    // MARK: - Private
    
    private func createRequest(for key: UUID) -> URLRequest {
        let body = FetchRequest(id: key)
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpBody = body.encoded()
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
}
