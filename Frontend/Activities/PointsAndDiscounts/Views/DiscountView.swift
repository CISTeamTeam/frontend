//
//  DiscountView.swift
//  Frontend
//
//  Created by Julian Schiavo on 18/11/2020.
//

import SwiftUI

struct DiscountView: View, Loadable {
    let discountID: UUID
    
    var key: UUID { discountID }
    
    @StateObject var loader = DiscountLoader()
    
    // - TODO: Create view for discount showing the title and amount of points required
    // This will be shown in a grid (like the post grid) so it should be a vertical stack
    func body(with discount: Discount) -> some View {
        VStack{
            Text(discount.name)
                .font(.title2).bold().multilineTextAlignment(.center)
            Spacer()
            Text(String(discount.requiredPoints) + " Points")
                .fontWeight(.light)
        }.padding().frame(maxWidth: .infinity, maxHeight: .infinity).border(Color.black)
    }
}

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(discountID: Placeholders.aDiscount.id)
            .frame(width: 200, height: 200)
            .border(Color.black)
    }
}
