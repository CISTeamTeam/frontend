//
//  ChallengesTab.swift
//  Frontend
//

import SwiftUI

/// A view that shows all of the current challenges
struct ChallengesTab: View, Loadable {
    
    /// The key used to load all challenges
    var key: Bool { false }
    
    /// The loader used to load all challenges
    @StateObject var loader = AllChallengesLoader.main
    
    /// Creates the contents of the view
    /// - Parameter response: The network response
    /// - Returns: The contents of the view
    func body(with response: AllChallengesLoader.Response) -> some View {
        NavigationView {
            List(response.challenges, id: \.self) { id in
                ChallengeRow(challengeID: id)
                    .padding(.vertical, 5)
            }
            .navigationTitle(Constants.challenges)
        }
    }
}

struct ChallengesTab_Previews: PreviewProvider {
    static var previews: some View {
        ChallengesTab()
    }
}
