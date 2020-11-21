//
//  LogInWithGoogleButton.swift
//  Frontend
//

import GoogleSignIn
import SwiftUI

/// A view that shows a Continue with Google Button
struct LogInWithGoogleButton: View {

    /// An action to run when the button is clicked
    var action: () -> Void

    /// The contents of the view
    var body: some View {
        Button(action: action) {
            Text(Constants.googleButtonText)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(10)
                .padding([.top, .bottom], 5)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(15)
        }
        .foregroundColor(.black)
    }
}

struct LogInWithGoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        LogInWithGoogleButton { }
    }
}
