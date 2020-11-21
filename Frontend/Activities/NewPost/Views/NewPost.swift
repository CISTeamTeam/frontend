//
//  NewPost.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import ImgurAnonymousAPI
import SwiftUI

/// A view that allows the user to create a new post
struct NewPost: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The currently selected image
    @State private var image: UIImage?
    
    /// The post's description
    @State private var description = ""
    
    /// Whether the sign in required alert is currently shown
    @State private var isSignInRequiredAlertPresented = false
    
    /// A poster that posts posts
    @StateObject private var poster = PostPoster()
    
    /// The contents of the view
    var body: some View {
        NavigationView {
            Form {
                NewPostImage(image: $image)
                NewPostDescription(text: $description)
                
                NewPostChallengePicker()
                
                Button(action: post) {
                    Label(Constants.post, systemImage: "tray.and.arrow.up.fill")
                }
                .disabled(image == nil || description.isEmpty)
            }
            .navigationTitle(Constants.newPost)
            .alert(isPresented: $isSignInRequiredAlertPresented) {
                Alert(title: Text("Sign In Required"), message: Text("Sign in in the Profile tab, then try again."))
            }
            .fullScreenCover(isPresented: $poster.isLoading, content: LoadingOverlay.init)
        }
        .alert(errorBinding: $poster.error)
    }
    
    /// Posts the post
    private func post() {
        hideKeyboard()
        
        guard let userID = signedInUserID else {
            isSignInRequiredAlertPresented.toggle()
            return
        }
        
        guard let image = image else { return }
        
        let post = Post(id: UUID().uuidString, userID: userID, description: description, url: .init(fileURLWithPath: ""), comments: [])
        poster.post(post, image: image)
        
        self.image = nil
        description = ""
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}
