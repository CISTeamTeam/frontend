//
//  CloseButton.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct CloseButton: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? dismiss) {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.secondary)
                .padding(5)
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
