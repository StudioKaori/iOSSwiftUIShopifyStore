//
//  ProductDetailScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - Property
    @Binding var product:Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // navbar
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top)
            
            // header
            Text("Hello")
            Text(product.title)
            
            // detail top part
            // detail bottom part
            // ratings sizes
            // description
            // quantity + favorite
            // add to cart
            Spacer()
        }  //: Vstack
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = previewSampleProductObject
    static var previews: some View {
        ProductDetailScreen(product: $previewProduct)
    }
}
