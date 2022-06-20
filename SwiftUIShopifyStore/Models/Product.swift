//
//  Product.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import Foundation
import MobileBuySDK

struct Product: Identifiable, Hashable{
    var id = UUID()
    var title: String
    var description: String
    var price: Decimal
    var imageUrls: [URL]
    var handle: String
    var variantID : GraphQL.ID
}
