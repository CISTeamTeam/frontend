//
//  SelfProfile.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import SwiftUI

struct SelfProfile: View {
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    var body: some View {
        NavigationView {
            if let id = signedInUserID {
                Profile(userID: id)
            } else {
                AuthView()
            }
        }
    }
}

struct SelfProfile_Previews: PreviewProvider {
    static var previews: some View {
        SelfProfile()
    }
}
