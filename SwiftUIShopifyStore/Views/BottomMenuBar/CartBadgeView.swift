//
//  CartBadgeView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-19.
//

import SwiftUI

struct CartBadgeView: View {
    @EnvironmentObject var cartItems: CartItems
    @State private var isAnimating = false
    
    var body: some View {
        
        if cartItems.totalQuantity != 0 {
            ZStack {
                
                Circle()
                    .foregroundColor(.black)
                
                Text("\(cartItems.totalQuantity)")
                    .bold()
                //                    .onReceive(cartItems.$totalQuantity, perform: {_ in
                //                        print("pulsate \(pulsate)")
                //                            self.pulsate = true
                //                    })
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .scaleEffect(self.isAnimating ? 1 : 2)
                    .animation(self.isAnimating ? Animation.spring().repeatCount(1) : nil)
                    .onAppear {
                        print("pulsate \(isAnimating)")
                        self.isAnimating = true
                    }
                
                
            }
            .offset(x: 10, y: -10)
            //: Zstack
        }
        
    }
}
