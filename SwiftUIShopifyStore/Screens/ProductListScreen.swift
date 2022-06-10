//
//  ProductListScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductListScreen: View {
    // MARK: - property
    @StateObject private var productListViewModel = ProductListViewModel()
    
    var body: some View {
        VStack {
            TitleView(title: "Products")
            
            ForEach(productListViewModel.products) { product in
                ProductCardView(product: product)
                
            }
        } //: VStack
        .onAppear{
            productListViewModel.getProducts(numbersOfProducts: 6)
        }
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
