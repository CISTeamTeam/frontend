//
//  PostDescription.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows the description for a post
struct PostDescription: View {
    /// The post
    let post: Post
    
    /// The contents of the view
    var body: some View {
        Text(post.description)
            .alignedHorizontally(to: .leading)
    }
}

struct PostDescription_Previews: PreviewProvider {
    static var previews: some View {
        PostDescription(post: Placeholders.aPost)
    }
}
