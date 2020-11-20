//
//  AuthView.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
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
                signInWithAppleButton
                logInWithSnapchatButton
            }
            .padding(.bottom, 30)
        }
        .alert(errorBinding: $authController.error)
        .fullScreenCover(isPresented: $authController.isLoading) {
            LoadingOverlay()
        }
    }
    
    /// Sign In With Apple Button
    private var signInWithAppleButton: some View {
        SignInWithAppleButton(.continue) { request in
            authController.startWithApple(request: request)
        } onCompletion: { result in
            switch result {
            case let .success(authorization):
                authController.appleAuthCompleted(with: authorization)
            case let .failure(error):
                authController.appleAuthFailed(with: error)
            }
        }
        .signInWithAppleButtonStyle(.whiteOutline)
        .cornerRadius(15)
        .frame(height: 60)
    }
    
    /// Log In With Snapchat Button
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
