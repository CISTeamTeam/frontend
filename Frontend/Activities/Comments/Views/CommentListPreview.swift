//
//  CommentListPreview.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CommentListPreview: View {
    let commentIDs: [ID]
    
    var body: some View {
        VStack(spacing: 12) {
            moreComments
            firstComment
        }
    }
    
    @ViewBuilder private var firstComment: some View {
        if let firstCommentID = commentIDs.first {
            CommentView(commentID: firstCommentID)
        }
    }
    
    private var moreComments: some View {
        NavigationLink(
            destination: CommentListStandalone(commentIDs: commentIDs),
            label: {
                Text("See all comments...")
            })
            .alignedHorizontally(to: .leading)
    }
}

struct CommentListPreview_Previews: PreviewProvider {
    static var previews: some View {
        CommentListPreview(commentIDs: Placeholders.comments.map(\.id))
    }
}
