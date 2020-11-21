//
//  Base.swift
//  Frontend
//

import SwiftUI

/// The base view for the app
struct Base: View {
    /// The main tab bar
    var body: some View {
        TabView {
            FeedTab()
                .tabItem {
                    Image(systemName: "leaf.fill")
                    Text("For You")
                }
            ChallengesTab()
                .tabItem {
                    Image(systemName: "lightbulb.fill")
                    Text(Constants.challenges)
                }
            NewPost()
                .tabItem {
                    Image(systemName: "plus")
                }
            DiscountsTab()
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text(Constants.discounts)
                }
            ProfileTab()
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
