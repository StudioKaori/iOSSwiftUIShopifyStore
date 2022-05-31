//
//  ShopifyClient.swift
//  Shopify
//
//  Created by Kaori Persson on 2022-04-13.
//

import Foundation
import SwiftUI
import MobileBuySDK

class ShopifyClient: NSObject {
    
    // Shopify storefront API doc: See 'Query' https://shopify.dev/api/storefront/2022-04/objects/Shop#fields
    static let client = Graph.Client(
        shopDomain: KeyManager().getValue(key: "shopDomain") as! String,
        apiKey:     KeyManager().getValue(key: "apiKey") as! String
    )
    
}


