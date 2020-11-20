//
//  CommentListScreen.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows all of the comments on a post, intended to be used as a top-level view inside a `NavigationView`
struct CommentListScreen: View {
    /// The ID of the post
    let postID: ID
    
    /// The IDs of the comments on the post
    let commentIDs: [ID]
    
    var body: some View {
        PaddedView(title: Constants.comments) {
            CommentList(postID: postID, commentIDs: commentIDs)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CommentListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentListScreen(postID: Placeholders.aPost.id, commentIDs: Placeholders.comments.map(\.id))
        }
    }
}
