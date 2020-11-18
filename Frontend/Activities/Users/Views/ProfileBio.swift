//
//  ProfileBio.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct ProfileBio: View {
    let user: User
    
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
