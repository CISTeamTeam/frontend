//
//  DiscountScreen.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

/// A view that shows info about a discount
struct DiscountScreen: View, Loadable {
    /// The ID of the discount
    let discountID: ID
    
    /// The ID of the current user
    let userID: ID
    
    /// The key used to load the discount
    var key: ID { discountID }
    
    /// The loader used to load the discount
    @StateObject var loader = DiscountLoader()
    
    /// The poster used to redeem discounts
    @StateObject var redeemer = DiscountRedeemer()
    
    /// Creates the contents of the view
    /// - Parameter discount: The loaded discount
    /// - Returns: The contents of the view
    func body(with discount: Discount) -> some View {
        PaddedView(title: Constants.discount) {
            VStack(spacing: 10) {
                Text(discount.name)
                    .font(.title)
                    .fontWeight(.heavy)
                    .alignedHorizontally(to: .leading)
                Text(discount.description)
                    .font(.title3)
                    .alignedHorizontally(to: .leading)
                Spacer()
                Text(String(discount.requiredPoints) + " Points Required")
                    .font(.title2)
                    .fontWeight(.bold)
                Button {
                    redeem(discount: discount)
                } label: {
                    Text("Redeem for \(discount.requiredPoints) Points")
                        .font(.headline)
                        .aligned(to: .center)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .frame(height: 60)
                        .cornerRadius(15)
                }
            }
            .alert(errorBinding: $redeemer.error)
            .padding(.bottom, 30)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    /// Redeems a discount
    /// - Parameter discount: The discount to redeem
    private func redeem(discount: Discount) {
        let redemption = DiscountRedeemer.Redemption(userID: userID, discount: discount)
        redeemer.post(redemption)
    }
}

struct DiscountScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscountScreen(discountID: Placeholders.aDiscount.id, userID: Placeholders.aUser.id)
    }
}
