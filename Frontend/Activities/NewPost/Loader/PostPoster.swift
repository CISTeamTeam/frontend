//
//  PostPoster.swift
//  Frontend
//

import Combine
import Foundation
import ImgurAnonymousAPI
import UIKit

/// A poster that posts, well, posts
class PostPoster: Poster {
    
    /// Whether a request is currently in progress.
    @Published var isLoading = false
    
    /// An error, if one occurred.
    @Published var error: IdentifiableError?
    
    /// An ongoing request
    var cancellable: AnyCancellable?
    
    /// The endpoint for the poster
    private let endpoint = "createPost"
    
    /// An image uploader
    private let imageUploader = ImgurUploader(clientID: Keys.imgurClientID)
    
    init() { }
    
    deinit {
        cancel()
    }
    
    /// Creates a new post with an image
    /// - Parameter content: The content to post
    func post(_ post: Post, image: UIImage) {
        isLoading = true
        imageUploader.upload(image) { result in
            switch result {
            case .success(let response):
                var newPost = post
                newPost.url = response.link
                self.post(newPost)
            case .failure(let error):
                self.catchError(error)
            }
        }
    }
    
    /// Creates a `URLRequest` used to post some content
    /// - Parameter comment: The post to post
    /// - Returns: A URL request
    func createRequest(for post: Post) -> URLRequest {
        let url = Constants.baseURL.appendingPathComponent(endpoint)
        return .postRequest(url: url, body: post)
    }
}
