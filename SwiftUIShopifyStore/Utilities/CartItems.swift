//
//  CartItems.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

/// Manages locally the cart items.
/// Registered to SwiftUIShopifyStoreApp as EnviromentObject
class CartItems: ObservableObject {
    @Published var cartItems: [Product] = []
    @Published var quantityOfCartItems: [String: Int] = [:]
    @Published var totalQuantity: Int = 0
    
    /// Set total numbers of items to self.totalQuantity
    func setTotalNumbersOfItems(){
        self.totalQuantity = quantityOfCartItems.reduce(0, { x, element in
            return x + element.value
        })
    }
}
