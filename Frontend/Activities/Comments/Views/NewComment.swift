//
//  NewComment.swift
//  Frontend
//

import SwiftUI

/// A view to post a comment on a post
struct NewComment: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The ID of the post to comment on
    let postID: ID
    
    /// The comment text
    @State private var text = "Comment on sustainability"
    
    /// Whether the sign in required alert is currently shown
    @State private var isSignInRequiredAlertPresented = false
    
    /// A poster that posts comments
    @StateObject private var poster = CommentPoster()
    
    /// The contents of the view
    var body: some View {
        VStack {
            Divider()
            TextField(Constants.postCommentPlaceholder, text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle()).disabled(true)
            Button(Constants.post, action: post)
                .alignedHorizontally(to: .trailing)
                .padding(4)
        }
        .alert(errorBinding: $poster.error)
        .alert(isPresented: $isSignInRequiredAlertPresented) {
            Alert(title: Text("Sign In Required"), message: Text("Sign in in the Profile tab, then try again."))
        }
        .fullScreenCover(isPresented: $poster.isLoading, content: LoadingOverlay.init)
    }
    
    /// Posts the comment
    private func post() {
        guard let userID = signedInUserID else {
            isSignInRequiredAlertPresented.toggle()
            return
        }
        let comment = Comment(id: UUID().uuidString, authorID: userID, postID: postID, text: text)
        poster.post(comment)
        text = ""
    }
}

struct NewComment_Previews: PreviewProvider {
    static var previews: some View {
        NewComment(postID: Placeholders.aPost.id)
    }
}
