//
//  AuthView.swift
//  Frontend
//
//  Created by Maximilian Mang Yu Ta on 16/11/2020.
//

import AuthenticationServices
import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject private var authController = AuthController.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            closeButton
            title
            Spacer()
//            signInWithAppleButton
            logInWithSnapchatButton
        }
        .padding(15)
//            .alert(errorBinding: $authenticationManager.error)
        .fullScreenCover(isPresented: $authController.isLoading) {
            ZStack {
                Color.black.opacity(0.8)
                ProgressView()
            }
        }
    }
    
    private var closeButton: some View {
        CloseButton()
            .alignedHorizontally(to: .trailing, padding: 10)
    }
    
    private var title: some View {
        Text("Sign In to Canopy")
            .font(.largeTitle)
            .fontWeight(.heavy)
    }
    
//    private var signInWithAppleButton: some View {
//        SignInWithAppleButton(.continue) { request in
//            self.authenticationManager.startAuthenticatingWithApple(request: request)
//        } onCompletion: { result in
//            self.authenticationManager.finishAuthenticatingWithApple(result: result)
//        }
//        .signInWithAppleButtonStyle(.white)
//        .cornerRadius(15)
//        .frame(height: 60)
//    }
    
    private var logInWithSnapchatButton: some View {
        LogInWithSnapchatButton {
            self.authController.startWithSnapchat()
        }
        .frame(height: 60)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
