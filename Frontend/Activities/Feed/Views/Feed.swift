//
//  Feed.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct Feed: View {
    
    let postIDs: [UUID]
    
    var body: some View {
        ScrollView {
            ForEach(postIDs, id: \.self) { postID in
                PostCard(postID: postID)
                Divider()
                
            }
        }
    }
}
    

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(postIDs: Post.placeholders.map(\.id))
    }
}
