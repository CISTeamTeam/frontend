//
//  FeedController.swift
//  Frontend
//

import Combine
import Foundation

/// A controller that manages the post feed
class FeedController: ObservableObject, ThrowsErrors {
    
    /// IDs of posts for the feed
    @Published var postIDs = [ID]()
    
    /// An error, if one occurred
    @Published var error: IdentifiableError?
    
    /// The last loaded feed page
    private var currentPage: FeedPage? {
        didSet {
            guard let page = currentPage else { return }
            postIDs.append(contentsOf: page.posts)
        }
    }
    
    /// The endpoint for the loader
    private let endpoint = "getPosts"
    
    /// Ongoing tasks
    private var cancellables = Set<AnyCancellable>()
    
    /// Whether the controller is currently loading a page
    private var isLoadingPage = false
    
    /// Loads the next page
    func loadMore() {
        guard !isLoadingPage else { return }
        isLoadingPage = true
        
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        let feedPageRequest = FeedPageRequest(hash: currentPage?.hash)
        let request = URLRequest.postRequest(url: url, body: feedPageRequest)
        print("->", request.url!.lastPathComponent, String(data: request.httpBody!, encoding: .utf8)!)
        
        URLSession.shared
            .dataTaskPublisher(for: request)
            .retryIfNeeded()
            .map {
                print("<-", request.url!.lastPathComponent, String(data: $0, encoding: .utf8)!)
                return $0
            }
            .decode(type: FeedPage.self, decoder: JSONDecoder.default)
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
    
    // MARK: - Singleton
    
    /// Shared feed controller
    static let shared = FeedController()
    
    /// Private initializer
    private init() {
        loadMore()
    }
}
