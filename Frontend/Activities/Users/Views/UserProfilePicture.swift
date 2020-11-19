//
//  UserProfilePicture.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserProfilePicture: View, Loadable {
    let userID: ID
    
    var key: ID { userID }
    
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
        WebImage(url: user.profilePictureURL)
            .resizable()
            .indicator(.activity)
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            .overlay(
                Circle().stroke(Color.black, lineWidth: 1)
            )
    }
}

struct UserProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePicture(userID: Placeholders.aUser.id)
    }
}
