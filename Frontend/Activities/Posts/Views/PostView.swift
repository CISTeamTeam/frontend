//
//  PostView.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

/// A view that shows info for a post
struct PostView: View, Loadable {
    /// The ID of the post
    let postID: ID
    
    /// The key used to load the post
    var key: ID { postID }
    
    /// The loader used to load the post
    @StateObject var loader = PostLoader()
    
    /// Creates the contents of the view for a post
    /// - Parameter post: The loaded post
    /// - Returns: The contents of the view
    func body(with post: Post) -> some View {
        VStack(spacing: 0) {
            UserSmallLabel(userID: post.userID)
                .defaultPadding()
            PostImage(post: post)
                .aspectRatio(contentMode: .fit)
            Spacer().frame(height: 10)
            PostDescription(post: post)
                .defaultPadding()
            PostRatingScale(postID: postID)
            Spacer().frame(height: 10)
            CommentListPreview(postID: postID, commentIDs: post.comments)
                .defaultPadding()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postID: Placeholders.aPost.id)
    }
}
