//
//  ChallengeScreen.swift
//  Frontend
//
//  Created by Maximilian Mang Yu Ta on 20/11/2020.
//

import SwiftUI

struct ChallengeScreen: View {
    let challenge: Challenge
    
    var body: some View {
        ScrollView{
            ChallengeImage(challenge: challenge)
            Text(challenge.description).font(.title3).padding()
            Text("Reward: " + String(challenge.rewardPoints) + " Points").fontWeight(.light).padding(.bottom)
            Divider()
        }.navigationTitle(challenge.name)
    }
}

struct ChallengeScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChallengeScreen(challenge: Placeholders.aChallenge)
        }
    }
}
