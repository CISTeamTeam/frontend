//
//  NewPostChallengePicker.swift
//  Frontend
//

import SwiftUI

/// A view that allows entering a post in a challenge
struct NewPostChallengePicker: View, Loadable {
    /// The currently selected challenge, if one is selected
    @Binding var challenge: Challenge?
    
    /// The key used to load all challenges
    var key: Bool { true }
    
    /// The loader used to load all challenges
    @ObservedObject var loader = AllChallengesLoader.main
    
    /// The contents of the view whether loaded or not
    var body: some View {
        Section(header: Text(Constants.challengePickerTitle),
                footer: Text(Constants.challengePickerDescription)) {
            loaderView
        }
    }
    
    /// Creates the contents of the view
    /// - Parameter response: The network response
    /// - Returns: The contents of the view
    func body(with response: AllChallengesLoader.Response) -> some View{
        Picker(selection: $challenge, label: Text("Select " + Constants.challengePickerTitle)) {
            ForEach(response.challenges, id: \.self) { id in
                ChallengeRow(challengeID: id)
                    .id(id)
            }
            .navigationTitle("Challenge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewPostChallengePicker_Previews: PreviewProvider {
    static var previews: some View {
        NewPostChallengePicker(challenge: .constant(nil))
    }
}
