//
//  UserSmallLabel.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserSmallLabel: View, Loadable {
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
