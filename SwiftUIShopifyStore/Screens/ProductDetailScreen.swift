//
//  ProductDetailScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - Property
    var product:Product
    
    var body: some View {
        VStack(alignment: .leading) {            
            // header
            HeaderDetailView(productTitle: product.title)
                .padding(.horizontal)
            
            // detail top part
            // detail bottom part
            // ratings sizes
            // description
            // quantity + favorite
            // add to cart
            Spacer()
        }  //: Vstack
        .background(Color.gray)
        
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = previewSampleProductObject
    static var previews: some View {
        ProductDetailScreen(product: previewProduct)
            .background(Color.gray)
    }
}
