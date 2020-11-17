//
//  Profile.swift
//  Frontend
//
//  Created by Julian Schiavo on 17/11/2020.
//

import SwiftUI

struct Profile: View, Loadable {
    @StateObject var loader = UserLoader()
    
    let userID: UUID
    
    var key: UUID { userID }
    
    // TODO: Complete profile view with Header + Posts
    // Profile-* Views can be used without saying Profile.*, just use the * name
    // For example, Header(user: user)
    func body(with user: User) -> some View {
        Text("Hello, World!")
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(userID: Constants.placeholder)
    }
}
