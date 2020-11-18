//
//  PostDescription.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PostDescription: View {
    let post: Post
    
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
