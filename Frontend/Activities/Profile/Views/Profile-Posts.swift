//
//  Profile-Posts.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

extension Profile {
    struct Posts: View {
        let user: User
        var vGridLayout = [ GridItem(.flexible(),spacing: 0),GridItem(.flexible(),spacing: 0)
        ]
        
        
        // TODO: Show a grid of the user's posts, using PostThumbnail for each post
        
        var body: some View {
            ScrollView {
                LazyVGrid(columns: vGridLayout,spacing: 0) {
                    ForEach(user.posts, id: \.self) { post in
                        PostThumbnail(postID: post)
                    }
                }
            }
        }
        
        
    }
}

struct ProfilePosts_Previews: PreviewProvider {
    static var previews: some View {
        Profile.Posts(user: .placeholder)
    }
}
