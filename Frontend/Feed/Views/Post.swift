//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct Post: View {
    var body: some View {
        VStack {
            Label("username", systemImage: "person.circle.fill")
                .font(.title2)
                .bold()
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}
