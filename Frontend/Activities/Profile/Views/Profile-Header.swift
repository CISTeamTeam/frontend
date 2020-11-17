//
//  Profile-Header.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

extension Profile {
    struct Header: View {
        let user: User
        
        // TODO: Complete profile header with `Picture` and labels for username, name, etc
        // Profile-* Views can be used without saying Profile.*, just use the * name
        var body: some View {
            VStack{
                HStack{
                    Profile.Picture(user: user).frame(width: 75, height: 75).padding(.leading)
                    VStack(alignment: .leading){
                        Text("Dispname").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).multilineTextAlignment(.leading).padding(.leading,5)
                        Text("username").font(.caption).fontWeight(.light).multilineTextAlignment(.leading).padding(.leading,5)
                    }.alignedHorizontally(to: .leading)
                }
                Text("bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio bio").font(.caption).padding(.horizontal).padding(.top,5)
            }
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        Profile.Header(user: .placeholder)
    }
}
