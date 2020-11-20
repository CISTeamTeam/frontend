//
//  FeedController.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import Combine
import Foundation

class FeedController: ObservableObject, ThrowsErrors {
    
    @Published var postIDs = [ID]()
    @Published var error: IdentifiableError?
    
    private var currentPage: FeedPage? {
        didSet {
            guard let page = currentPage else { return }
            postIDs.append(contentsOf: page.posts)
        }
    }
    
    /// The endpoint for the loader
    private let endpoint = "getPosts"
    
    private var cancellables = Set<AnyCancellable>()
    
    private var isLoadingPage = false
    
    /// Requests the object for a key to be loaded
    /// - Parameter key: The key identifying the object
    func loadMore() {
        guard !isLoadingPage else { return }
        isLoadingPage = true
        
        var feedPageRequest: FeedPageRequest
        if let page = currentPage {
            feedPageRequest = FeedPageRequest(hash: page.hash)
        } else {
            feedPageRequest = FeedPageRequest(hash: nil)
        }
        
        let request = createPageRequest(feedPageRequest: feedPageRequest)
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: FeedPage.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { [weak self] newPage in
                self?.currentPage = newPage
            }
            .store(in: &cancellables)
    }
    
    /// Cancels any ongoing requests
    private func cancel() {
        cancellables.forEach { $0.cancel() }
        cancellables = []
    }
    
    // MARK: - Read Posts
    
    func markAsRead(_ postID: ID) {
        postIDs.removeAll { $0 == postID }
        
        let request = createMarkAsReadRequest(postID: postID)
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retry(1)
            .map {
                $0.data
            }
            .decode(type: StatusResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.catchCompletionError(completion)
            } receiveValue: { status in
                return
            }
            .store(in: &cancellables)
    }
    
    // MARK: - URL Requests
    
    private func createPageRequest(feedPageRequest: FeedPageRequest) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpBody = feedPageRequest.encoded()
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
    
    private func createMarkAsReadRequest(postID: ID) -> URLRequest {
        let endpoint = "readPost"
        let body = IDRequest(id: postID)
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        
        var request = URLRequest(url: url)
        request.httpBody = body.encoded()
        
        request.httpMethod = Constants.postMethod
        request.addValue(Constants.contentTypeJSON, forHTTPHeaderField: Constants.contentTypeHeader)
        
        return request
    }
    
    // MARK: - Singleton
    
    static let shared = FeedController()
    
    private init() {
        loadMore()
    }
}
