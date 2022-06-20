//
//  CheckoutViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class CheckoutInfo: ObservableObject {
    @Published var checkoutId: GraphQL.ID = GraphQL.ID(rawValue: "")
}
