//
//  PostThumbnail.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

struct PostThumbnail: View, Loadable {
    @StateObject var loader = PostLoader()
    
    let postID: ID
    
    var key: ID { postID }
    
    func body(with post: Post) -> some View {
        PostImage(post: post)
    }
}

struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(postID: Placeholders.aPost.id)
    }
}
