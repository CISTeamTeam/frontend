//
//  ChallengeImage.swift
//  Frontend
//

import SDWebImageSwiftUI
import SwiftUI

/// A view that shows the image for a challenge
struct ChallengeImage: View {
    /// The challenge
    let challenge: Challenge
    
    /// The contents of the view
    var body: some View {
        WebImage(url: challenge.imageURL)
            .resizable()
            .indicator(.activity)
            .aspectRatio(1, contentMode: .fill)
            .clipped()
    }
}

struct ChallengeImage_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeImage(challenge: Placeholders.aChallenge)
    }
}
