//
//  CartItems.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI
import MobileBuySDK

class CartItems: ObservableObject {
    @Published var cartItems: [Product] = []
    @Published var quantityOfCartItems: [String: Int] = [:]
    @Published var totalQuantity: Int = 0
    @Published var checkoutId: GraphQL.ID = GraphQL.ID(rawValue: "")
    
    
    func setTotalNumbersOfItems(){
        self.totalQuantity = quantityOfCartItems.reduce(0, { x, element in
            return x + element.value
        })
    }
}
