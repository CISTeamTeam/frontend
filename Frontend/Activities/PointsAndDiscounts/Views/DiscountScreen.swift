//
//  DiscountScreen.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct DiscountScreen: View, Loadable {
    let discountID: UUID
    
    var key: UUID { discountID }
    
    @StateObject var loader = DiscountLoader()
    
    // - TODO: Create the screen that shows discount details (this shows more details than DiscountView as it is shown filling the whole screen)
    // Show price, title, description, and a button to redeem the discount
    func body(with discount: Discount) -> some View {
        VStack{
            Text(discount.name).font(.title).padding()
            Text(String(discount.requiredPoints) + " Points")
                .font(.title2)
                .fontWeight(.light)
        }
    }
}

struct DiscountScreen_Previews: PreviewProvider {
    static var previews: some View {
        DiscountScreen(discountID: Placeholders.aDiscount.id)
    }
}
