//
//  ContentView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - property
    @ObservedObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()
    @State var shopName = ""
    

    var body: some View {
        HStack {
            Text(shopName)
        }
        .onAppear{
            shopInfoViewModel.getShopInfo(completion: {
                shopName = shopInfoViewModel.shopInfo.name
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
