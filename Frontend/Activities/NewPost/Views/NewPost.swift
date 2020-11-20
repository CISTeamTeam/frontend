//
//  NewPost.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct NewPost: View {
    @State private var image: UIImage?
    
    @State private var isImageSheetPresented = false
    
    @State private var description = ""
    
    var body: some View {
        Form {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
            }
            Button(action: { self.isImageSheetPresented.toggle() }, label: {
                HStack{
                    Image(systemName: "square.and.arrow.up").frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Upload Image")
                }
            })
            .sheet(isPresented: $isImageSheetPresented, content: {
                ImagePicker(image: $image)
            })
            Section(header: Text("Post Description")) {
            TextEditor(text: $description)
            }
            Button(
                action:{}, //idk what action
                label: {
                    Label("Post", systemImage: "arrowshape.turn.up.right.fill")
                }
            )
        }
    }
}

struct NewPost_Previews: PreviewProvider {
    static var previews: some View {
        NewPost()
    }
}
