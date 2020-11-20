//
//  ChallengeRow.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct ChallengeRow: View, Loadable {
    let challengeID: ID
    
    var key: ID { challengeID }
    
    @StateObject var loader = ChallengeLoader()
    
    func body(with challenge: Challenge) -> some View {
        NavigationLink(
            destination: ChallengeScreen(challenge: challenge),
            label: {
                VStack {
                    Text(challenge.name)
                        .font(.largeTitle)
                        .alignedHorizontally(to: .leading)
                        .padding(.horizontal)
                        .padding(.top)
                    Text(String(challenge.rewardPoints) + " Points")
                        .font(.body)
                        .fontWeight(.light)
                        .alignedHorizontally(to: .leading)
                        .padding(.horizontal).padding(.bottom)
                }
            })
            .alignedHorizontally(to: .leading)
    }
}

struct ChallengeRow_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeRow(challengeID: Placeholders.aChallenge.id)
    }
}
