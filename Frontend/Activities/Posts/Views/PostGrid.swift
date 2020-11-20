//
//  PostGrid.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

/// A view that shows a grid of posts
struct PostGrid: View {
    /// An array of post IDs
    let postIDs: [ID]
    
    /// A 2x2 grid layout
    private let gridLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    /// The contents of the view
    var body: some View {
        if postIDs.isEmpty {
            Text("No Posts")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .aligned(to: .center)
        } else {
            grid
        }
    }
    
    /// The grid of posts
    private var grid: some View {
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
