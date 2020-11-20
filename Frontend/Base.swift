//
//  Base.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

typealias ID = String

struct Base: View {
    var body: some View {
        TabView {
            Feed(postIDs: Placeholders.posts.map(\.id))
                .tabItem {
                    Label("For You", systemImage: "leaf.arrow.circlepath")
                }
            NewPost()
                .tabItem {
                Label("New Post", systemImage: "plus.app.fill")
            }
            SelfProfile()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
            ChallengeList(challengeIDs: Placeholders.challenges.map(\.id))
                .tabItem {
                Label("Challenges", systemImage: "rosette")
            }
            PointsDiscounts(userID: Placeholders.aUser.id)
                .tabItem {
                    Label("Points", systemImage: "person.fill")
                }
        }
    }
}

struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base()
    }
}
