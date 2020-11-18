//
//  UserLabel.swift
//  Frontend
//
//  Created by Maximilian Mang Yu Ta on 18/11/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserLabel: View, Loadable {
    let userID: UUID
    
    var key: UUID { userID }
    
    @StateObject var loader = UserLoader()
    
    func body(with user: User) -> some View {
        HStack{
            Profile.Picture(user: user)
                .frame(width: 50, height: 50)
            Text(user.username)
                .font(.title2)
                .padding(.vertical)
                .alignedHorizontally(to: .leading)
        }
        
            
    }
}

struct UserLabel_Previews: PreviewProvider {
    static var previews: some View {
        UserLabel(userID: Constants.placeholder)
    }
}
