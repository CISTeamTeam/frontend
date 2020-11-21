//
//  UserUsernameLabel.swift
//  Frontend
//

import SwiftUI

/// A view that shows a username label for a user
struct UserUsernameLabel: View, Loadable {
    /// The ID of the user
    let userID: ID
    
    /// The key used to load the user
    var key: ID { userID }
    
    /// The loader used to load the user
    @StateObject var loader = UserLoader()
    
    /// Creates the contents of the view
    /// - Parameter user: The loaded user
    /// - Returns: The contents of the view
    func body(with user: User) -> some View {
        NavigationLink(
            destination: Profile(userID: userID),
            label: {
                Text(user.username)
                    .bold()
            })
            .foregroundColor(.primary)
            .buttonStyle(PlainButtonStyle())
    }
}

struct UserUsernameLabel_Previews: PreviewProvider {
    static var previews: some View {
        UserUsernameLabel(userID: Placeholders.aUser.id)
    }
}
