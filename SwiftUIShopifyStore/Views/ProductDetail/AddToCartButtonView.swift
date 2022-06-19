//
//  AddToCartButtonView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct AddToCartButtonView: View {
    // MARK: - Property
    @EnvironmentObject var cartItems: CartItems
    let product: Product
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            cartItems.cartItems.append(product)
            cartItems.quantityOfCartItems.updateValue(1, forKey: product.handle)
        }, label: {
          Spacer()
          Text("Add to cart".uppercased())
                .font(.logoFont(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
          Spacer()
        }) //: BUTTON
        .padding(15)
        .background(.black)
        .clipShape(Capsule())
    }
}

//struct AddToCartButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddToCartButtonView()
//    }
//}
