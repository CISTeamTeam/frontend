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
        ScrollView(.vertical){
            Text("x")
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed(postIDs: Post.placeholders.map(\.id))
    }
}
