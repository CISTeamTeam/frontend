//
//  UserUsernameLabel.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct UserUsernameLabel: View, Loadable {
    let userID: UUID
    
    var key: UUID { userID }
    
    @StateObject var loader = UserLoader()
    
    func body(with user: User) -> some View {
        NavigationLink(
            destination: Profile(userID: userID),
            label: {
                contents(with: user)
            })
            .foregroundColor(.primary)
            .buttonStyle(PlainButtonStyle())
    }
    
    private func contents(with user: User) -> some View {
        Text(user.username)
            .bold()
    }
}

struct UserUsernameLabel_Previews: PreviewProvider {
    static var previews: some View {
        UserUsernameLabel(userID: Placeholders.aUser.id)
    }
}
