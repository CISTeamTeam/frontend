//
//  Post.swift
//  Frontend
//
//  Created by Julian Schiavo on 15/11/2020.
//

import SwiftUI

struct Post: View {
    var body: some View {
        VStack{
            HStack{
                Image("EmptyAvatar").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50,alignment: .leading).cornerRadius(20).clipped()
                Text("username").font(.system(size: 25)).fontWeight(.light).multilineTextAlignment(.leading)
            }
        }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post()
    }
}
