//
//  CartItems.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

class CartItems: ObservableObject {
    @Published var cartItems: [Product] = []
    @Published var quantityOfCartItems: [String: Int] = [:]
    
    
    func getTotalNumbersOfItems() -> Int {
        return quantityOfCartItems.reduce(0, { x, element in
            return x + element.value
        })
    }
}
