//
//  PointsHeader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PointsHeader: View, Loadable {
    let user: User
    
    var key: UUID { user.id }
    
    @StateObject var loader = UserPointsLoader()
    
    // - TODO: Create the header for `PointsDiscount` view, by showing "You have", then new line, then very large text with the amount of points the user has, then new line, then "points"
    func body(with userPoints: UserPoints) -> some View {
        Text("TODO" + userPoints.points.description)
    }
}

struct PointsHeader_Previews: PreviewProvider {
    static var previews: some View {
        PointsHeader(user: Placeholders.aUser)
    }
}
