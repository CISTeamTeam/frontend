//
//  CommentView.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A loadable view that displays the contents of a comment by its ID
struct CommentView: View, Loadable {
    /// The ID of the comment
    let commentID: ID
    
    /// The key used to load the comment
    var key: ID { commentID }
    
    /// The loader used to load the comment
    @StateObject var loader = CommentLoader()
    
    /// Creates the contents of the view for the comment
    /// - Parameter comment: The loaded comment
    /// - Returns: The contents of the view
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
