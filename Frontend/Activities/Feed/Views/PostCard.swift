//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCard: View, Loadable {
    @StateObject var loader = PostLoader()
    
    let postID: UUID
    
    var key: UUID { postID }
    
    func body(with post: Post) -> some View {
        VStack {
            UserLabel(userID: post.authorID)
            WebImage(url:post.url).resizable()
                .aspectRatio(contentMode: .fit)
                .border(Color.blue, width: 3.0)
            
            HStack{
                Button(action:{}){
                    Image(systemName: "heart").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(5)
                }
                Button(action:{}){
                    Image(systemName: "bubble.left").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).padding(5)
                }
            }.alignedHorizontally(to: .leading).padding(5)
            Text(post.description).alignedHorizontally(to: .leading).padding(10)

        }
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard(postID: Constants.placeholder)
    }
}
