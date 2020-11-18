//
//  CommentList.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CommentList: View {
    let commentIDs: [UUID]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(commentIDs, id: \.self) { commentID in
                    CommentView(commentID: commentID)
                        .padding(.vertical, 5)
                }
            }
        }
    }
}

struct CommentList_Previews: PreviewProvider {
    static var previews: some View {
        CommentList(commentIDs: Placeholders.comments.map(\.id))
    }
}
