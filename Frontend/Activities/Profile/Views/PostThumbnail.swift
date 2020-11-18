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
    
    let postID: UUID
    
    var key: UUID { postID }
    
    func body(with post: Post) -> some View {
        WebImage(url: post.url)
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: .fit)
    }
}

struct PostThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        PostThumbnail(postID: Constants.placeholder)
    }
}
