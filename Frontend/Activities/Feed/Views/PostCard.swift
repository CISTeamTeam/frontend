//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct PostCard: View {
    var body: some View {
        VStack {
            Label("username", systemImage: "person.circle.fill")
                .font(.title2).padding().alignedHorizontally(to: .leading)
            //TODO: add an image from imgur
            Image(systemName:"eye.slash").resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250.0, height: 250.0, alignment: .center)
                .border(Color.blue, width: 3.0)
            
            HStack{
                Button(action:{}){
                    Image(systemName: "heart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(5)
                }
                Button(action:{}){
                    Image(systemName: "bubble.left").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(5)
                }
                Text("Caption").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(.light)
            }.alignedHorizontally(to: .leading).padding(5)
            Text("Description").alignedHorizontally(to: .leading).padding(10)

        }
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard()
    }
}
