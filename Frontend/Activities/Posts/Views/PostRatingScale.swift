//
//  PostRatingScale.swift
//  Frontend
//

import SwiftUI

/// A view that allows a user to rate a post
struct PostRatingScale: View, Loadable {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The ID of the post to rate
    let postID: ID
    
    /// The key used to check whether the post is ratable
    var key: IDRequest {
        IDRequest(id: postID, userID: signedInUserID ?? "")
    }
    
    /// The loader used to check whether the post is ratable
    @StateObject var loader = PostRatabilityLoader()
    
    /// The object used to rate posts
    @StateObject var rater = PostRater()
    
    /// Whether the user has rated the post
    @State private var hasBeenRated = false
    
    /// Overrides the `Loadable` protocol's body to hide the view completely if the user is not signed in
    var body: some View {
        if signedInUserID != nil {
            loaderView
        }
    }
    
    /// Creates the contents of the view, displaying nothing if the post is not ratable
    /// - Parameter status: Whether the post is ratable
    /// - Returns: The contents of the view, or an empty view
    @ViewBuilder func body(with status: StatusResponse) -> some View {
        switch status.status {
        case .success:
            contents
        case .failure:
            EmptyView()
        }
    }
    
    /// The contents of the view if the post is ratable
    private var contents: some View {
        VStack {
            if hasBeenRated {
                thankYouMessage
            } else {
                scale
            }
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
        .padding(.vertical, 12)
        .defaultPadding()
    }
    
    /// The rating scale
    private var scale: some View {
        Group {
            Text(Constants.ratingQuestion)
                .alignedHorizontally(to: .leading)
            HStack {
                ForEach(1..<8) { i in
                    Button {
                        rate(i)
                    } label: {
                        Text(String(i))
                            .font(Font.title3.monospacedDigit())
                            .fontWeight(.light)
                            .padding(2)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
    
    /// A thank you message shown after rating
    private var thankYouMessage: some View {
        Text(Constants.ratingThankYou)
            .frame(maxWidth: .infinity)
    }
    
    /// Rates the post
    /// - Parameter rating: The user's rating
    private func rate(_ rating: Int) {
        guard let userID = signedInUserID else { return }
        let rating = PostRating(id: postID, userID: userID, rating: rating)
        rater.post(rating)
        hasBeenRated = true
    }
}

struct PostRatingScale_Previews: PreviewProvider {
    static var previews: some View {
        PostRatingScale(postID: Placeholders.aPost.id)
    }
}
