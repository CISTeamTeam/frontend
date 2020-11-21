//
//  DiscountsTab.swift
//  Frontend
//

import SwiftUI

/// A view shown for the Discounts tab
struct DiscountsTab: View {
    /// The ID of the currently signed in user
    @AppStorage(Constants.signedInUserIDKey) var signedInUserID: ID?
    
    /// The contents of the view
    var body: some View {
        NavigationView {
            if let id = signedInUserID {
                Discounts(userID: id)
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
