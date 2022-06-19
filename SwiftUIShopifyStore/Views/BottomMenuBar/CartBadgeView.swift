//
//  CartBadgeView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-19.
//

import SwiftUI

struct CartBadgeView: View {
    @EnvironmentObject var cartItems: CartItems
    @State private var pulsate = false
    
    var body: some View {
        
        if cartItems.totalQuantity != 0 {
            ZStack {

                Circle()
                    .foregroundColor(.black)
                
                Text("\(cartItems.totalQuantity)")
                    .onReceive(cartItems.$totalQuantity, perform: {_ in
                        print("pulsate \(pulsate)")
                            self.pulsate = true
                    })
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .scaleEffect(self.pulsate ? 2 : 1)
                    .animation(self.pulsate ? Animation.spring().repeatCount(3) : nil)
                    
                    
            }
            .offset(x: 10, y: -10)
             //: Zstack
        }
        
    }
}
