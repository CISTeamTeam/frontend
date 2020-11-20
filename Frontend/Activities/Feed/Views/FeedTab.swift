//
//  FeedTab.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

/// A view that shows a feed of posts
struct FeedTab: View {
    /// The IDs of the posts (optional, overrides the default loading behaviour)
    var postIDs: [ID]?
    
    /// Controller used to load the feed
    @ObservedObject private var controller = FeedController.shared
    
    /// The contents of the view
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
            .onAppear {
                controller.loadMore()
            }
            .navigationTitle(Constants.appName)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
    

struct FeedTab_Previews: PreviewProvider {
    static var previews: some View {
        FeedTab(postIDs: Placeholders.posts.map(\.id))
    }
}
