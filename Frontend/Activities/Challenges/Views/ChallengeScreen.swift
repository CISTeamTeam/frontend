//
//  ChallengeScreen.swift
//  Frontend
//

import SwiftUI

/// A view that shows information about a challenge
struct ChallengeScreen: View {
    /// The challenge
    let challenge: Challenge
    
    /// The contents of the view
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ChallengeImage(challenge: challenge)
                Text(challenge.description)
                    .font(.title3)
                    .defaultPadding()
                    .alignedHorizontally(to: .leading)
                Text("Win " + String(challenge.rewardPoints) + " points!")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
        .navigationTitle(challenge.name)
    }
}

struct ChallengeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChallengeScreen(challenge: Placeholders.aChallenge)
        }
    }
}
