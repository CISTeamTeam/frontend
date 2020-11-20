//
//  PointsHeader.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a user's points
struct PointsHeader: View, Loadable {
    /// The user
    let user: User
    
    /// The key used to load the user's points
    var key: ID { user.id }
    
    /// The loader used to load the user's points
    @StateObject var loader = UserPointsLoader()
    
    /// Creates the contents of the view
    /// - Parameter userPoints: The user's points
    /// - Returns: The contents of the view
    func body(with userPoints: UserPoints) -> some View {
        VStack(spacing: 0) {
            Text("You Have")
                .font(.title)
                .fontWeight(.semibold)
            Text(String(userPoints.points))
                .font(.system(size: 70))
                .fontWeight(.heavy)
            Text("Points!")
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}

struct PointsHeader_Previews: PreviewProvider {
    static var previews: some View {
        PointsHeader(user: Placeholders.aUser)
    }
}
