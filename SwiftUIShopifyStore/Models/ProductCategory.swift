//
//  ProductCategory.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import Foundation

/// Product Category in Shopify. It's 'Tag' in shopify backend.
enum ProductCategory: String, CaseIterable {
    case all = "all"
    case lip = "lip"
    case skin = "skin"
}
