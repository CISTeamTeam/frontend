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
                    Label("For You", systemImage: "flowchart")
                }
            SignInView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct Base_Previews: PreviewProvider {
    static var previews: some View {
        Base()
    }
}
