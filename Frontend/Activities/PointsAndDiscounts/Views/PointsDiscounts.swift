//
//  PointsDiscounts.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PointsDiscounts: View, Loadable {
    let userID: UUID
    
    var key: UUID { userID }
    
    @StateObject var loader = UserLoader()
    
    // - TODO: Create the main points/discounts page, using points header and discount grid
    // This is similar to the main Profile view (header + grid)
    // I made grid for you since it's similar to PostGrid
    func body(with user: User) -> some View {
        Text("TODO" + user.name)
    }
}

struct PointsDiscounts_Previews: PreviewProvider {
    static var previews: some View {
        PointsDiscounts(userID: Placeholders.aUser.id)
    }
}
