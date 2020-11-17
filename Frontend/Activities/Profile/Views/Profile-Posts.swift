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
        
        // TODO: Show a grid of the user's posts, using PostThumbnail for each post
        var body: some View {
            Text("Hello, World!")
        }
    }
}

struct ProfilePosts_Previews: PreviewProvider {
    static var previews: some View {
        Profile.Posts(user: .placeholder)
    }
}
