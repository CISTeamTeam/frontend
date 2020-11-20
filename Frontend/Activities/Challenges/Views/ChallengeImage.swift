//
//  ChallengeImage.swift
//  Frontend
//
//  Created by Maximilian Mang Yu Ta on 20/11/2020.
//

import SDWebImageSwiftUI
import SwiftUI

struct ChallengeImage: View {
    let challenge: Challenge
    
    var body: some View {
        WebImage(url: challenge.imageURL)
            .resizable()
            .indicator(.activity)
            .aspectRatio(contentMode: .fit)
    }
}

struct ChallengeImage_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeImage(challenge: Placeholders.aChallenge)
    }
}
