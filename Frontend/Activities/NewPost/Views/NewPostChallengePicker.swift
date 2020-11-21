//
//  NewPostChallengePicker.swift
//  Frontend
//
//  Created by Maximilian Mang Yu Ta on 21/11/2020.
//

import SwiftUI

struct NewPostChallengePicker: View, Loadable {
    @State private var displayArray = ["None"]
    @State private var selection = 0
    @State private var pickerVisible = false
    
    var key: Bool { false }
    
    @ObservedObject var loader = AllChallengesLoader.main
    
    
    func body(with response: AllChallengesLoader.Response) -> some View{
        Section (header: Text("Challenge")) {
            VStack{
                HStack{
                    Text("Enter Challenge: ")
                    Spacer()
                    Button((displayArray + response.challenges)[selection]){
                        self.pickerVisible.toggle()
                    }
                }
                if pickerVisible {
                    HStack{
                        Spacer()
                        Picker(selection: $selection, label: Text("")){
                            ForEach(0..<(displayArray + response.challenges).count){
                                Text(((displayArray + response.challenges)[$0])).foregroundColor(.secondary)
                            }
                        }.pickerStyle(WheelPickerStyle())
                        .onTapGesture {
                            self.pickerVisible.toggle()
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

struct NewPostChallengePicker_Previews: PreviewProvider {
    static var previews: some View {
        NewPostChallengePicker()
    }
}
