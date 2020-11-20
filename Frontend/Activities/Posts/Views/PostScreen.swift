//
//  PostScreen.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a post, intended to be used as a top-level view inside a `NavigationView`
struct PostScreen: View {
    /// The ID of the post
    let postID: ID
    
    /// The contents of the view
    var body: some View {
        ScrollView {
            PostView(postID: postID)
        }
        .navigationTitle(Constants.post)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PostScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostScreen(postID: Placeholders.aPost.id)
        }
    }
}
