//
//  ProductListScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductListScreen: View {
    // MARK: - property
    @ObservedObject var productListViewModel: ProductListViewModel = ProductListViewModel()
    @State var productList: [Product] = []
    
    var body: some View {
        VStack {
            ForEach($productList) { product in
                ProductDetailScreen(product: product)
                
            }
        } //: VStack
        .onAppear{
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
