//
//  PostRatingScale.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
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
            Text(Constants.ratingQuestion)
            HStack {
                ForEach(1..<11) { i in
                    Button {
                        rate(i)
                    } label: {
                        Text(String(i))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
    }
    
    /// Rates the post
    /// - Parameter rating: The user's rating
    private func rate(_ rating: Int) {
        
    }
}

struct PostRatingScale_Previews: PreviewProvider {
    static var previews: some View {
        PostRatingScale(postID: Placeholders.aPost.id)
    }
}
