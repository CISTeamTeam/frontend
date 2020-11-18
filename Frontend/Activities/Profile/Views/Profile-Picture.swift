//
//  Profile-Picture.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

extension Profile {
    struct Picture: View {
        let user: User
        
        var body: some View {
            WebImage(url: user.profilePictureURL)
                .resizable()
                .indicator(.activity)
                .clipShape(Circle())
                .aspectRatio(contentMode:.fit)
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 3)
                )
        }
    }
}

struct ProfilePicture_Previews: PreviewProvider {
    static var previews: some View {
        Profile.Picture(user: .placeholder)
    }
}
