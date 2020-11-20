//
//  NewComment.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import SwiftUI

/// A view that allows a user to post a comment on a post
struct NewComment: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The ID of the post to comment on
    let postID: ID
    
    /// The comment text
    @State private var text = ""
    
    /// Whether the sign in required alert is currently shown
    @State private var isSignInRequiredAlertPresented = false
    
    /// A poster that posts comments
    @StateObject private var poster = CommentPoster()
    
    /// The contents of the view
    var body: some View {
        VStack {
            Divider()
            TextField("Add a comment...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Post", action: post)
                .alignedHorizontally(to: .trailing)
                .padding(4)
        }
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
