//
//  UserSmallLabel.swift
//  Frontend
//

import SwiftUI
import SDWebImageSwiftUI

/// A view that shows a label for a user
struct UserSmallLabel: View, Loadable {
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
                contents(with: user)
            })
            .foregroundColor(.primary)
            .buttonStyle(PlainButtonStyle())
    }
    
    /// Creates the contents of the view
    /// - Parameter user: The loaded user
    /// - Returns: The contents of the view
    private func contents(with user: User) -> some View {
        HStack {
            UserProfilePicture(userID: user.id)
                .frame(width: 35)
            Text(user.username)
                .font(.headline)
                .fontWeight(.bold)
                .padding(.vertical)
                .alignedHorizontally(to: .leading)
        }
    }
}

struct UserSmallLabel_Previews: PreviewProvider {
    static var previews: some View {
        UserSmallLabel(userID: Placeholders.aUser.id)
    }
}
