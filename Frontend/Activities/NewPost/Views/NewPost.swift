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
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
            }
            Button(action: { self.isImageSheetPresented.toggle() }, label: {
                HStack{
                    Image(systemName: "square.and.arrow.up").font(.largeTitle).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("Upload Image").font(.largeTitle)
                }
            })
            .sheet(isPresented: $isImageSheetPresented, content: {
                ImagePicker(image: $image)
            })
            
            Form {
                TextField("Description: ", text: $description)
            }
            
            Button(
                action:{}, //idk what action
                label: {
                    HStack{
                    Text("Post").font(.largeTitle)
                    Image(systemName: "arrowshape.turn.up.right.fill").font(.largeTitle).frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
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
