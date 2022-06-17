//
//  BottomMenuBarView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct BottomMenuBarView: View {
    // MARK: - Property
    let currentView: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Spacer()
            
            if currentView != "HomeScreen" {
                NavigationLink(destination: HomeScreen()) {
                    Image(systemName: "house")
                    .foregroundColor(Color.black)
                }
            } else {
                Image(systemName: "house")
                .foregroundColor(Color.black)
            }
            
            Spacer()
            
            if currentView != "ProductListScreen" {
                NavigationLink(destination: ProductListScreen()) {
                    Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.black)
                }
            } else {
                Image(systemName: "magnifyingglass")
                .foregroundColor(Color.black)
            }

            Spacer()

            if currentView != "CartScreen" {
                NavigationLink(destination: Text("Cart")) {
                    Image(systemName: "cart")
                    .foregroundColor(Color.black)
                }
            } else {
                Image(systemName: "cart")
                .foregroundColor(Color.black)
            }

            Spacer()
            
        } //: bottom menu
    }
}

//struct BottomMenuBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomMenuBarView()
//    }
//}
