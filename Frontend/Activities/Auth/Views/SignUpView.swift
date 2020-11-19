//
//  SignUpView.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import SwiftUI

struct SignUpView: View {
    var id: String
    
    @State private var name = ""
    @State private var username = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $name)
            TextField("Username", text: $username)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(id: "1")
    }
}
