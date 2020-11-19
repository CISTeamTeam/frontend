//
//  PostGrid.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

struct PostGrid: View {
    let postIDs: [ID]
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: 0) {
            ForEach(postIDs, id: \.self) { postID in
                PostThumbnail(postID: postID)
            }
        }
    }
}

struct PostGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PostGrid(postIDs: Placeholders.posts.map(\.id))
        }
    }
}
