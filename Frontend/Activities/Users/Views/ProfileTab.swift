//
//  ProfileTab.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import SwiftUI

struct ProfileTab: View {
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    var body: some View {
        NavigationView {
            if let id = signedInUserID {
                Profile(userID: id)
            } else {
                AuthView()
            }
        }
    }
}

struct ProfileTab_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTab()
    }
}
