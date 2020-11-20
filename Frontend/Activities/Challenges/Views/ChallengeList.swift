//
//  ChallengeList.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct ChallengeList: View {
    let challengeIDs: [ID]
    
    var body: some View {
        List(challengeIDs, id: \.self) { id in
            ChallengeRow(challengeID: id)
                .padding(.vertical, 5)
        }
    }
}

struct ChallengeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChallengeList(challengeIDs: Placeholders.challenges.map(\.id))
        }
    }
}
