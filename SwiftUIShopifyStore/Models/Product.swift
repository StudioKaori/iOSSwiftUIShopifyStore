//
//  Product.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import Foundation

/// Product information
struct Product: Identifiable, Hashable{
    let id = UUID()
    let title: String
    let description: String
    let price: Decimal
    let imageUrls: [URL]
    let handle: String
    
}
