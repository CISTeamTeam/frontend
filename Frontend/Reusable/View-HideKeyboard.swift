//
//  View-HideKeyboard.swift
//  Frontend
//
//  Created by Julian Schiavo on 20/11/2020.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
