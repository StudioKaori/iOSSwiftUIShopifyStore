//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - property
    @StateObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()
    
    // MARK: - Body
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

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}