//
//  LogInWithSnapchatButton.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct LogInWithSnapchatButton: View {
    var action: () -> Void
    
    private let snapchatBrandColor = Color(red: 255 / 255, green: 252 / 255, blue: 0)
    
    var body: some View {
        Button(action: action) {
            contents
        }
        .foregroundColor(.black)
    }
    
    private var contents: some View {
        HStack {
            ghostLogo
            label
        }
        .padding(10)
        .padding([.top, .bottom], 5)
        .frame(maxWidth: .infinity)
        .background(snapchatBrandColor)
        .cornerRadius(15)
    }
    
    private var ghostLogo: some View {
        Image("snapchat-ghost")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 30)
    }
    
    private var label: some View {
        Text("Continue with Snapchat")
            .font(.title3)
            .fontWeight(.semibold)
    }
}


struct LogInWithSnapchatButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInWithSnapchatButton { }
    }
}
