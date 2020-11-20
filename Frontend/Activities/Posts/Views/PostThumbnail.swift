//
//  PostThumbnail.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view that shows a thumbnail for a post
struct PostThumbnail: View, Loadable {
    /// The ID of the post
    let postID: ID
    
    /// The key used to load the post
    var key: ID { postID }
    
    /// The loader used to load the poster
    @StateObject var loader = PostLoader()
    
    /// Creates the contents of the view for a post
    /// - Parameter post: The loaded post
    /// - Returns: The contents of the view
    func body(with post: Post) -> some View {
        PostImage(post: post)
            .clipped()
            .aspectRatio(1, contentMode: .fill)
    }
}

struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(postID: Placeholders.aPost.id)
    }
}
