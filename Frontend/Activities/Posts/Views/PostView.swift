//
//  PostView.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct PostView: View, Loadable {
    @StateObject var loader = PostLoader()
    
    let postID: ID
    
    var key: ID { postID }
    
    func body(with post: Post) -> some View {
        VStack(spacing: 0) {
            UserSmallLabel(userID: post.authorID)
                .defaultPadding()
            PostImage(post: post)
            Spacer().frame(height: 10)
            PostDescription(post: post)
                .defaultPadding()
            Spacer().frame(height: 10)
            CommentListPreview(commentIDs: post.comments)
                .defaultPadding()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(postID: Placeholders.aPost.id)
    }
}
