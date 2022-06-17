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
                Text("KAORI")
                    .font(.custom("Cormorant Infant", size: 88))
                
                Text(shopInfoViewModel.shopInfo.name)
                    .font(.custom("Cormorant Infant", size: 18))
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
