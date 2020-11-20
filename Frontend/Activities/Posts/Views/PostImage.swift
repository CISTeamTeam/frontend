//
//  PostImage.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view that shows a tappable image for a post, which brings the user to the info for a post
struct PostImage: View {
    /// The post
    let post: Post
    
    /// The contents of the view
    var body: some View {
        NavigationLink(destination: PostScreen(postID: post.id)) {
            WebImage(url: post.url)
                .resizable()
                .indicator(.activity)
        }
        .alignedHorizontally(to: .leading)
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(post: Placeholders.aPost)
    }
}
