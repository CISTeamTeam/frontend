//
//  Feed.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct Feed: View {
    
    var postIDs: [ID]?
    
    @ObservedObject private var controller = FeedController.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(postIDs ?? controller.postIDs, id: \.self) { postID in
                        PostView(postID: postID)
                        Divider()
                    }
                }
            }
            .navigationTitle("Canopy")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(postIDs: Placeholders.posts.map(\.id))
    }
}
