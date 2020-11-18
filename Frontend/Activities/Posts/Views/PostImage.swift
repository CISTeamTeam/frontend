//
//  PostImage.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostImage: View {
    let post: Post
    
    var body: some View {
        NavigationLink(
            destination: PostScreen(postID: post.id),
            label: {
                WebImage(url: post.url)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fit)
            })
            .alignedHorizontally(to: .leading)
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(post: Placeholders.aPost)
    }
}
