//
//  CommentListStandalone.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CommentListStandalone: View {
    let commentIDs: [UUID]
    
    var body: some View {
        PaddedView(title: "Comments") {
            CommentList(commentIDs: commentIDs)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CommentListStandalone_Previews: PreviewProvider {
    static var previews: some View {
        CommentListStandalone(commentIDs: Placeholders.comments.map(\.id))
    }
}
