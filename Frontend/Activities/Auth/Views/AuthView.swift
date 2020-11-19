//
//  AuthView.swift
//  Frontend
//
//  Created by Julian Schiavo on 19/11/2020.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct AuthView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @ObservedObject private var authController = AuthController.shared
    
    var body: some View {
        contents
            .padding(15)
            //            .alert(errorBinding: $authenticationManager.error)
            .fullScreenCover(isPresented: $authController.isLoading) {
                ZStack {
                    Color.black.opacity(0.5)
                    ProgressView()
                }
            }
    }
    
    @ViewBuilder private var contents: some View {
        if let id = authController.signUpUserID {
            SignUpView(id: id)
        } else {
            SignInView()
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

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
