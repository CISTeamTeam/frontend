//
//  ChallengeRow.swift
//  Frontend
//

import SwiftUI

/// A view that shows a row with a challenge
struct ChallengeRow: View, Loadable {
    
    /// The ID of the challenge
    let challengeID: ID
    
    /// The key used to load the challenge
    var key: ID { challengeID }
    
    /// The loader used to load the challenge
    @StateObject var loader = ChallengeLoader()
    
    /// Creates the contents of the view
    /// - Parameter challenge: The loaded challenge
    /// - Returns: The contents of the view
    func body(with challenge: Challenge) -> some View {
        NavigationLink(destination: ChallengeScreen(challenge: challenge)) {
            HStack(spacing: 20) {
                ChallengeImage(challenge: challenge)
                    .frame(maxWidth: 100)
                    .cornerRadius(10)
                VStack {
                    Text(challenge.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .alignedHorizontally(to: .leading)
                    Text("Get " + String(challenge.rewardPoints) + " points!")
                        .alignedHorizontally(to: .leading)
                }
            }
            .alignedHorizontally(to: .leading)
        }
    }
}

struct ChallengeRow_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRow(challengeID: Placeholders.aChallenge.id)
    }
}
