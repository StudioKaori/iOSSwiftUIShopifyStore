//
//  ContentView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import SwiftUI

struct ContentView: View {
    // MARK: - property
    
    private func getShopName() -> Text {
        var shopName: String = ""
        ShopifyClient.getShopInfo() { shopInfo in
            shopName = shopInfo.name
        }
        return Text(shopName)
    }

    var body: some View {
        HStack {
            getShopName()
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
