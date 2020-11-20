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

struct AuthView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject private var authController = AuthController.shared
    
    var body: some View {
        PaddedView(title: "Welcome to Canopy") {
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
