//
//  CartItems.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

class CartItems: ObservableObject {
    @Published var cartItems:[Product: Int] = [:]
}
