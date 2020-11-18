//
//  ProfileUsername.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct ProfileUsername: View {
    let user: User
    
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
