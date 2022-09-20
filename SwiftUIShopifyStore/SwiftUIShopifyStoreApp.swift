//
//  SwiftUIShopifyStoreApp.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import SwiftUI
import SwiftUIBamMiniPlayerLibrary

@main
struct SwiftUIShopifyStoreApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .top) {
                NavigationView {
                                HomeScreen()
                            }
                            .environmentObject(CartItems())
                
                
                // Player
            PlayerView()
            }
        }
    }
}
