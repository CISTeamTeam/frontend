//
//  Base.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct Base: View {
    var body: some View {
        TabView {
            Feed(postIDs: Placeholders.posts.map(\.id))
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("For You")
                }
            ChallengeList(challengeIDs: Placeholders.challenges.map(\.id))
                .tabItem {
                    Image(systemName: "lightbulb.fill")
                    Text("Challenges")
                }
            NewPost()
                .tabItem {
                    Image(systemName: "plus")
                }
            PointsDiscounts(userID: Placeholders.aUser.id)
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("Discounts")
                }
            SelfProfile()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base()
    }
}
