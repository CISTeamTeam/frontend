//
//  ProfileTab.swift
//  Frontend
//

import SwiftUI

/// A view shown for the Profile tab
struct ProfileTab: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The contents of the view
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
