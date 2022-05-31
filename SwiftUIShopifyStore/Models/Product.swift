//
//  Product.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import Foundation

struct Product: Identifiable{
    var id = UUID()
    var title: String
    var description: String
    var price: Decimal
    var imageUrls: [URL]
    var handle: String
    
}
