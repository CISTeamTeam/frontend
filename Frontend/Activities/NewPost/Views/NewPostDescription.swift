//
//  NewPostDescription.swift
//  Frontend
//

import SwiftUI

/// A view with a text field for the description of a post
struct NewPostDescription: View {
    /// A binding to the description text
    @Binding var text: String
    
    /// The contents of the view
    var body: some View {
        Section(header: Text("Description")) {
            TextEditor(text: $text).disabled(true)
        }
    }
}

struct NewPostDescription_Previews: PreviewProvider {
    static var previews: some View {
        NewPostDescription(text: .constant("Description text"))
    }
}
