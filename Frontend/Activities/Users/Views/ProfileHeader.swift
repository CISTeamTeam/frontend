//
//  ProfileHeader.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

struct ProfileHeader: View {
    let user: User
    
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
