//
//  PostStack.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a stack of posts
struct PostStack: View {
    /// An array of post IDs
    let postIDs: [ID]
    
    /// The contents of the view
    var body: some View {
        LazyVStack {
            ForEach(postIDs, id: \.self) { postID in
                PostView(postID: postID)
            }
        }
    }
}

struct PostStack_Previews: PreviewProvider {
    static var previews: some View {
        PostStack(postIDs: Placeholders.posts.map(\.id))
    }
}
