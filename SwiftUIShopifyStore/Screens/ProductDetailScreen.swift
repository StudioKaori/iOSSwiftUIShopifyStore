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
        HStack {
            Text(product.title)
        }
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = Product(id: UUID(), title: "Product title", description: "Super nice!", price: 100, imageUrls: [URL(fileURLWithPath: "https://developer.apple.com/documentation/swiftui/appstorage")], handle: "handle")
    static var previews: some View {
        ProductDetailScreen(product: $previewProduct)
    }
}
