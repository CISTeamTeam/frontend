//
//  ProfileName.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct ProfileName: View {
    let user: User
    
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
