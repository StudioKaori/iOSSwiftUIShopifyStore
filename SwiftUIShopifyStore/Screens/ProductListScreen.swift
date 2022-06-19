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
    @State private var productSearchQuery = ""
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 2)
    
    // MARK: - body
    var body: some View {
        VStack {
            
            // title and searchbar
            HStack {
                Text("Products")
                    .font(.logoFont(size: 32))
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search...", text: $productSearchQuery)
                        .keyboardType(.asciiCapable)
                        
                }
                .frame(width: UIScreen.main.bounds.width - 160)
                .padding(8)
                .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.gray, lineWidth: 1)
                    )
  
            }  //: title and searchbar
            
            
            ScrollView {

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productListViewModel.products) { product in
                        ProductCardView(product: product)
                    }
                }
            } //: VStack
            .padding(.horizontal, 10)
            .onAppear{
                productListViewModel.getProducts(numbersOfProducts: 30)
            }
            
            Spacer()
            BottomMenuBarView(currentView: "ProductListScreen")
        }
        .navigationBarHidden(true)
    }
}

struct ProductListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductListScreen()
    }
}
