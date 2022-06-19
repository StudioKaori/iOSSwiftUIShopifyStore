//
//  CartScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI
import MobileBuySDK

struct CartScreen: View {

    
    var body: some View {
        VStack (alignment: .center) {
            Text("Cart")
                .font(.logoFont(size: 32))
            Divider()
            
            CartItemsView()
            
            Spacer()
            BottomMenuBarView(currentView: "CartScreen")

        } //: Vstack
        .navigationBarHidden(true)
                    
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}
