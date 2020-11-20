//
//  LogInWithSnapchatButton.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a Continue with Snapchat Button
struct LogInWithSnapchatButton: View {
    
    /// An action to run when the button is clicked
    var action: () -> Void
    
    /// The Snapchat official brand color
    private let snapchatBrandColor = Color(red: 255 / 255, green: 252 / 255, blue: 0)
    
    /// The contents of the view
    var body: some View {
        Button(action: action) {
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
        .foregroundColor(.black)
    }
    
    /// The Snapchat logo
    private var ghostLogo: some View {
        Image("snapchat-ghost")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 30)
    }
    
    /// The button label
    private var label: some View {
        Text(Constants.snapchatButtonText)
            .font(.title2)
            .fontWeight(.semibold)
    }
}

struct LogInWithSnapchatButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInWithSnapchatButton { }
    }
}
