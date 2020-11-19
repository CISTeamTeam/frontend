//
//  PostScreen.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PostScreen: View {
    let postID: ID
    
    var body: some View {
        ScrollView {
            PostView(postID: postID)
        }
        .navigationTitle("Post")
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
