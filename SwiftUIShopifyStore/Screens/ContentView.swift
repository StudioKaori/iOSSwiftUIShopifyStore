//
//  ContentView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - property
    @StateObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()

    var body: some View {
        NavigationView {
            VStack {
                Text(shopInfoViewModel.shopInfo.name)
                    .padding()
                
                ProductListScreen()

            } //: VStack
            .onAppear{
                shopInfoViewModel.getShopInfo()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
