//
//  ProductCardView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductCardView: View {
    // MARK: - Property
    
    let product: Product
    
    // MARK: - Body
    var body: some View {
        Text(product.title)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: previewSampleProductObject)
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
    }
}
