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
    
    func body(with userPoints: UserPoints) -> some View {
        VStack{
            Text("You Have").font(.title).fontWeight(.light)
            Text(userPoints.points.description).font(.system(size: 100))
            Text("Points").font(.body).fontWeight(.light)
        }
    }
}

struct PointsHeader_Previews: PreviewProvider {
    static var previews: some View {
        PointsHeader(user: Placeholders.aUser)
    }
}
