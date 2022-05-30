//
//  ProductListViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import Foundation
import SwiftUI
import MobileBuySDK

class ProductListViewModel: ObservableObject {
    @Published var products: [Product] = []
}

struct Product{
    var title: String
    var description: String
    var price: Decimal
    var images: [Image]
    var handle: String
    
}
