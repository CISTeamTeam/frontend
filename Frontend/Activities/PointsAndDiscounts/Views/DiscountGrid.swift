//
//  DiscountGrid.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct DiscountGrid: View, Loadable {
    
    private let gridLayout = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var key: Bool { true }
    @ObservedObject var loader = AllDiscountsLoader.main
    
    func body(with discountIDs: [UUID]) -> some View {
        LazyVGrid(columns: gridLayout, spacing: 0) {
            ForEach(discountIDs, id: \.self) { discountID in
                DiscountView(discountID: discountID)
            }
        }
    }
}

struct DiscountGrid_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DiscountGrid()
        }
    }
}
