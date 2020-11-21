//
//  ProfileHeader.swift
//  Frontend
//

import SwiftUI

/// A view that shows the header of a profile
struct ProfileHeader: View {
    /// The user
    let user: User
    
    /// The contents of the view
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                UserProfilePicture(userID: user.id)
                    .frame(width: 70)
                VStack(alignment: .leading) {
                    ProfileName(user: user)
                    ProfileUsername(user: user)
                }
            }
            .alignedHorizontally(to: .leading)
            
            ProfileBio(user: user)
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(user: Placeholders.aUser)
    }
}
