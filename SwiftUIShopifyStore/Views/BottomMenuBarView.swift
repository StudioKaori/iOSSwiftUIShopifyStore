//
//  BottomMenuBarView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct BottomMenuBarView: View {
    // MARK: - Property
    @Environment(\.presentationMode) var presentationMode
    let currentView: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Spacer()
            
            if currentView != "HomeScreen" {
                Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "arrow.left")
                    .foregroundColor(Color.black)
                }
                Spacer()
            }
            
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
            
        } //: Hstack
    }
}

//struct BottomMenuBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomMenuBarView()
//    }
//}
