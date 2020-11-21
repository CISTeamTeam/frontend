//
//  Profile.swift
//  Frontend
//

import SwiftUI

/// A view that shows a user's profile
struct Profile: View, Loadable {
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
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeader(user: user)
                    .defaultPadding()
                PostGrid(postIDs: user.posts)
            }
            .padding(.top, 10)
            .navigationTitle(user.username)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Profile(userID: Placeholders.aUser.id)
        }
    }
}
