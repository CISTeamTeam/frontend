//
//  Constants.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import Foundation

/// Constants for the app
enum Constants {
    /// The base URL for the server
    static let baseURL = URL(string: "http://7f03aed3a68a.ngrok.io")!
    
    /// App Name
    static let appName = "Canopy"
    
    /// The name of the `UserDefaults` key for the currently signed in user
    static let signedInUserIDKey = "signedInUserID"
    
    /// Post button text
    static let post = "Post"
    
    // MARK: - Auth
    
    /// Sign In screen title
    static let signInTitle = "Welcome to Canopy"
    
    /// Snapchat button text
    static let snapchatButtonText = "Continue with Snapchat"
    
    // MARK: - Challenges
    
    /// Challenges name
    static let challenges = "Challenges"
    
    // MARK: - Comments
    
    /// Comments title
    static let comments = "Comments"
    
    /// See all comments button text
    static let seeAllCommentsButtonText = "See all comments..."
    
    /// Post comment placeholder
    static let postCommentPlaceholder = "Add a comment..."
    
    // MARK: - Discounts
    
    /// Discounts title
    static let discounts = "Discounts"
    
    /// Title for single discount screen
    static let discount = "Discount"
    
    // MARK: - New Posts
    
    /// New Post title
    static let newPost = "New Post"
    
    /// Description placeholder
    static let description = "Description"
    
    /// Select Image Button text
    static let selectImageButtonText = "Select Image"
    
    // MARK: - Posts
    
    /// Question asked for post rating
    static var ratingQuestion: String {
        [
            "How innovative is the idea in this post?",
            "How effective is this post in communicating its message?",
            "How much has this post demonstrated environmental awareness?"
        ].randomElement()!
    }
}
