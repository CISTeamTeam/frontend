//
//  UserProfilePicture.swift
//  Frontend
//

import SDWebImageSwiftUI
import SwiftUI

/// A view that shows a user's profile picture
struct UserProfilePicture: View, Loadable {
    /// The ID of the user
    let userID: ID
    
    /// The key used to load the user
    var key: ID { userID }
    
    /// The loader used to load the user
    @StateObject var loader = UserLoader()
    
    /// Creates the contents of the view
    /// - Parameter user: The loaded user
    /// - Returns: The contents of the view
    func body(with user: User) -> some View {
        NavigationLink(
            destination: Profile(userID: userID),
            label: {
                contents(with: user)
            })
            .foregroundColor(.primary)
            .buttonStyle(PlainButtonStyle())
    }
    
    /// Creates the contents of the image
    /// - Parameter user: The loaded image
    /// - Returns: The contents
    private func contents(with user: User) -> some View {
        WebImage(url: user.profilePictureURL)
            .resizable()
            .indicator(.activity)
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 1)
            )
    }
}

struct UserProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePicture(userID: Placeholders.aUser.id)
    }
}
