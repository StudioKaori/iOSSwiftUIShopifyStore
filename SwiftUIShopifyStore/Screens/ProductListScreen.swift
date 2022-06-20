//
//  ProductListScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

enum ProductCategory: String, Hashable, CaseIterable {
    case all = "all"
    case lip = "lip"
    case skin = "skin"
}

struct ProductListScreen: View {
    // MARK: - property
    @StateObject private var productListViewModel = ProductListViewModel()
    
    @State private var productSearchQuery = ""
    
    @State private var productCategory = ProductCategory.all
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 10), count: 2)
    
    
    // MARK: - body
    var body: some View {
        VStack {
            
            // MARK: -  title and searchbar
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
                .onChange(of: productSearchQuery,
                          perform: { query in
                    if query != "", query != " " {
                        productListViewModel.getProducts(numbersOfProducts: 20, query: query)
                    }
                })
  
            }  //: title and searchbar
            
            
            Divider()
            
            // MARK: - Product category
            HStack {
                Spacer()
                
                ForEach(ProductCategory.allCases, id: \.rawValue) { category in
                    Button(action: {
                        self.productCategory = category
                    }, label: {
                        Text(category.rawValue.uppercased())
                    })
                    Spacer()
                }
            }
            .padding(.horizontal, 10)
             //: category
            
            Divider()
            
            
            // MARK: - Search result
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productListViewModel.products) { product in
                        ProductCardView(product: product)
                    }
                }
            }
            .padding(.horizontal, 10)
            .onAppear{
                productListViewModel.getProducts(numbersOfProducts: 30)
            }
             //: search result
            
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
