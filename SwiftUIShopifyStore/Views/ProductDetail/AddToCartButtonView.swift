//
//  AddToCartButtonView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI
import MobileBuySDK

struct AddToCartButtonView: View {
    // MARK: - Property
    @EnvironmentObject var cartItems: CartItems
    @StateObject var addToCartViewModel: AddToCartViewModel = AddToCartViewModel()
    let product: Product
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            
            let quantity = cartItems.quantityOfCartItems[product.handle] ?? 0
            let newQuantity = quantity + 1
            // if the item is not in the cartItems.cartItems, append the product
            if quantity == 0 {
                cartItems.cartItems.append(product)
            }
            
            addToCartViewModel.addToCart(variantID: product.variantID)
            
            cartItems.quantityOfCartItems.updateValue(newQuantity, forKey: product.handle)
            cartItems.setTotalNumbersOfItems()
            feedback.impactOccurred()
            
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
