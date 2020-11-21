//
//  ProfileUsername.swift
//  Frontend
//

import SwiftUI

/// A view that shows a user's username
struct ProfileUsername: View {
    /// The user
    let user: User
    
    /// The contents of the view
    var body: some View {
        Text(user.username)
            .foregroundColor(.secondary)
    }
}

struct ProfileUsername_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUsername(user: Placeholders.aUser)
    }
}
