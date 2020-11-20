//
//  DiscountsTab.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import SwiftUI

/// A view shown for the Discounts tab
struct DiscountsTab: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The contents of the view
    var body: some View {
        NavigationView {
            if let id = signedInUserID ?? Placeholders.aUser.id {
                PaddedView(title: Constants.discounts) {
                    Discounts(userID: id)
                }
            } else {
                AuthView()
            }
        }
    }
}

struct DiscountsTab_Previews: PreviewProvider {
    static var previews: some View {
        DiscountsTab()
    }
}
