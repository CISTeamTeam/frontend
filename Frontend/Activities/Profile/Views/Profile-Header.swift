//
//  Profile-Header.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

extension Profile {
    struct Header: View {
        let user: User
        
        // TODO: Complete profile header with `Picture` and labels for username, name, etc
        // Profile-* Views can be used without saying Profile.*, just use the * name
        var body: some View {
            Text("Hello, World!")
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        Profile.Header(user: .placeholder)
    }
}
