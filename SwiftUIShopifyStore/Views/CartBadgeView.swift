//
//  CartBadgeView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-19.
//

import SwiftUI

struct CartBadgeView: View {
    @EnvironmentObject var cartItems: CartItems
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
            
            Text("\(cartItems.getTotalNumbersOfItems())")
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .offset(x: 10, y: -10)
    }
}

struct CartBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        CartBadgeView()
    }
}
