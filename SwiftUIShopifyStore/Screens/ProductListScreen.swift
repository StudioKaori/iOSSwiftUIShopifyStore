//
//  ProductListScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductListScreen: View {
    // MARK: - property
    @ObservedObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()
    @State var shopName = ""
    
    @ObservedObject var productListViewModel: ProductListViewModel = ProductListViewModel()
    @State var productList: [Product] = []
    
    var body: some View {
        HStack {
            Text(shopName)
                .padding()
            
            ForEach(productList) { product in
                Text(product.title)
                
            }
        }
        .onAppear{
            shopInfoViewModel.getShopInfo(completion: {
                shopName = shopInfoViewModel.shopInfo.name
            })
            
            productListViewModel.getProducts(numbersOfProducts: 6, completion: {
                productList = productListViewModel.products
            })
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
