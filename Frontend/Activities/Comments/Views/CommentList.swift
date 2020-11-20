//
//  CommentList.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view showing all of the comments on a post
struct CommentList: View {
    /// The ID of the post
    let postID: ID
    
    /// The IDs of the comments on the post
    let commentIDs: [ID]
    
    /// The contents of the view
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(commentIDs, id: \.self) { commentID in
                    CommentView(commentID: commentID)
                        .padding(.vertical, 5)
                }
            }
        }
        .overlay(
            NewComment(postID: postID)
                .alignedVertically(to: .bottom)
        )
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentList(postID: Placeholders.aPost.id, commentIDs: Placeholders.comments.map(\.id))
    }
}
