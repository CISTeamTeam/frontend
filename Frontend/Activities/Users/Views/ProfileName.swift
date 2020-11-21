//
//  ProfileName.swift
//  Frontend
//

import SwiftUI

/// A view that shows a user's name
struct ProfileName: View {
    /// The user
    let user: User
    
    /// The contents of the view
    var body: some View {
        Text(user.name)
            .font(.title)
            .fontWeight(.bold)
    }
}

struct ProfileName_Previews: PreviewProvider {
    static var previews: some View {
        ProfileName(user: Placeholders.aUser)
    }
}
