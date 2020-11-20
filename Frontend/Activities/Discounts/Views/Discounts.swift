//
//  Discounts.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows the current user's points and available discounts
struct Discounts: View, Loadable {
    /// The ID of the user
    let userID: ID
    
    /// The key used to load the user
    var key: ID { userID }
    
    /// The loader used to load the user
    @StateObject var loader = UserLoader()
    
    /// Creates the contents of the view
    /// - Parameter user: The user
    /// - Returns: The contents of the view
    func body(with user: User) -> some View {
        ScrollView {
            PointsHeader(user: user)
            DiscountGrid(userID: userID)
        }
    }
}

struct Discounts_Previews: PreviewProvider {
    static var previews: some View {
        Discounts(userID: Placeholders.aUser.id)
    }
}
