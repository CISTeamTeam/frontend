//
//  AuthView.swift
//  Frontend
//

import AuthenticationServices
import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

/// A view that handles authenticating and signing in
struct AuthView: View {
    
    /// The controller used for authentication
    @ObservedObject private var authController = AuthController.shared
    
    /// The contents of the view
    var body: some View {
        PaddedView(title: Constants.signInTitle) {
            VStack(alignment: .leading) {
                Spacer()
                logInWithGoogleButton
                logInWithSnapchatButton
            }
            .padding(.bottom, 30)
        }
        .alert(errorBinding: $authController.error)
        .fullScreenCover(isPresented: $authController.isLoading, content: LoadingOverlay.init)
    }
    
    /// Continue with Google Button
    private var logInWithGoogleButton: some View {
        LogInWithGoogleButton {
            self.authController.startWithGoogle()
        }
        .frame(height: 60)
    }
    
    /// Continue with Snapchat Button
    private var logInWithSnapchatButton: some View {
        LogInWithSnapchatButton {
            self.authController.startWithSnapchat()
        }
        .frame(height: 60)
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
