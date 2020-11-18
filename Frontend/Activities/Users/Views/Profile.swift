//
//  Profile.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

struct Profile: View, Loadable {
    let userID: UUID
    
    var key: UUID { userID }
    
    @StateObject var loader = UserLoader()
    
    func body(with user: User) -> some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfileHeader(user: user)
                    .defaultPadding()
                PostGrid(postIDs: user.posts)
            }
            .padding(.top, 10)
            .navigationTitle(user.username)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Profile(userID: Placeholders.aUser.id)
        }
    }
}
