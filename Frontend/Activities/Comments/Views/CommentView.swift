//
//  CommentView.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CommentView: View, Loadable {
    let commentID: ID
    
    var key: ID { commentID }
    
    @StateObject var loader = CommentLoader()
    
    func body(with comment: Comment) -> some View {
        HStack(alignment: .top) {
            UserProfilePicture(userID: comment.authorID)
                .frame(width: 35)
            CommentInfo(comment: comment)
                .padding(.top, 3)
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(commentID: Placeholders.aComment.id)
    }
}
