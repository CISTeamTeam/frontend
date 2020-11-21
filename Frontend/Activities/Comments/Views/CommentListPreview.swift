//
//  CommentListPreview.swift
//  Frontend
//

import SwiftUI

/// A view that shows the first comment on a post
struct CommentListPreview: View {
    /// The ID of the post
    let postID: ID
    
    /// The IDs of the comments on the posts
    let commentIDs: [ID]
    
    /// The contents of the view
    var body: some View {
        VStack(spacing: 12) {
            moreComments
            firstComment
        }
    }
    
    /// A view showing the first comment, if it exists
    @ViewBuilder private var firstComment: some View {
        if let firstCommentID = commentIDs.first {
            CommentView(commentID: firstCommentID)
        }
    }
    
    /// A button to see all the comments on the post
    private var moreComments: some View {
        NavigationLink(destination: CommentListScreen(postID: postID, commentIDs: commentIDs)) {
            Text(Constants.seeAllCommentsButtonText)
        }
        .alignedHorizontally(to: .leading)
    }
}

struct CommentListPreview_Previews: PreviewProvider {
    static var previews: some View {
        CommentListPreview(postID: Placeholders.aPost.id, commentIDs: Placeholders.comments.map(\.id))
    }
}
