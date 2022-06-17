//
//  BottomMenuBarView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct BottomMenuBarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink(destination: HomeScreen()) {
                Image(systemName: "house")
                .foregroundColor(Color.black)
            }
            Spacer()
            
            NavigationLink(destination: ProductListScreen()) {
                Image(systemName: "magnifyingglass")
                .foregroundColor(Color.black)
            }
            Spacer()

            NavigationLink(destination: ProductListScreen()) {
                Image(systemName: "cart")
                .foregroundColor(Color.black)
            }
            
            Spacer()
            
        } //: bottom menu
    }
}

struct BottomMenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuBarView()
    }
}
