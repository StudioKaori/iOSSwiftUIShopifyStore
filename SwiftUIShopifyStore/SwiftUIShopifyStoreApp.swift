//
//  SwiftUIShopifyStoreApp.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import SwiftUI

@main
struct SwiftUIShopifyStoreApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeScreen()
            }
            .environmentObject(CartItems())
        }
    }
}
