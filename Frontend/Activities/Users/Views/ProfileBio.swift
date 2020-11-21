//
//  ProfileBio.swift
//  Frontend
//

import SwiftUI

/// A view that shows a user's bio
struct ProfileBio: View {
    /// The user
    let user: User
    
    /// The contents of the view
    var body: some View {
        Text(user.bio)
            .alignedHorizontally(to: .leading)
    }
}

struct ProfileBio_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBio(user: Placeholders.aUser)
    }
}
