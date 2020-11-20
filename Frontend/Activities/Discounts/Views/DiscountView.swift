//
//  DiscountView.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows a discount, used in a grid
struct DiscountView: View, Loadable {
    /// The ID of the discount
    let discountID: ID
    
    /// The key used to load the discount
    var key: ID { discountID }
    
    /// The loader used to load the discount
    @StateObject var loader = DiscountLoader()
    
    /// Creates the contents of the view
    /// - Parameter discount: The loaded discount
    /// - Returns: The contents of the view
    func body(with discount: Discount) -> some View {
        VStack {
            Text(discount.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            Text(String(discount.requiredPoints) + " points")
                .font(.headline)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .border(Color.primary)
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(discountID: Placeholders.aDiscount.id)
            .frame(width: 200, height: 200)
            .border(Color.primary)
    }
}
