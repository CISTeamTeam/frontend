//
//  DiscountGrid.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a grid of discounts
struct DiscountGrid: View, Loadable {
    /// The ID of the current user
    let userID: ID
    
    /// A 2x2 grid layout
    private let gridLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    /// The key used to load all discounts
    var key: Bool { false }
    
    /// The loader used to load all discounts
    @ObservedObject var loader = AllDiscountsLoader.main
    
    /// Creates the contents of the view
    /// - Parameter response: The network response
    /// - Returns: The contents of the view
    func body(with response: AllDiscountsLoader.Response) -> some View {
        LazyVGrid(columns: gridLayout, spacing: 0) {
            ForEach(response.discounts, id: \.self) { discountID in
                NavigationLink(destination: DiscountScreen(discountID: discountID, userID: userID)) {
                    DiscountView(discountID: discountID)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct DiscountGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DiscountGrid(userID: Placeholders.aUser.id)
        }
    }
}
