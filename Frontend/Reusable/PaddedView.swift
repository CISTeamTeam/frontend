//
//  PaddedView.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct PaddedView<Content: View>: View {
    private let title: String
    private let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        content
            .defaultPadding()
            .padding(.top, 10)
            .navigationTitle(title)
    }
}

struct PaddedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PaddedView(title: "Preview") {
                Text("Hello World")
            }
        }
    }
}
