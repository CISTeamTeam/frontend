//
//  PostStack.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PostStack: View {
    let postIDs: [ID]
    
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
