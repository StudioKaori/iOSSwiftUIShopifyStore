//
//  ProductViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-09-18.
//

import Foundation
import SwiftUI
import MobileBuySDK

/// ViewModel for getting Product information from Shopify backend.
class ProductViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var product: Product = Product(title: "", description: "", price: 0, imageUrls: [], handle: "")
    
    // MARK: - Methods
    /// Get product information from Shopify backend.
    ///  To specify the category, set 'tag:tagname' in the query parameter.
    func getProductDetail(productHandle: String) {
        // products information
        // https://shopify.dev/api/storefront/2022-04/queries/products
        // product field : https://shopify.dev/api/storefront/2022-04/objects/Product#fields
        // buy sdk: https://github.com/Shopify/mobile-buy-sdk-ios/
        let productsQuery = Storefront.buildQuery { $0
            .product(handle: productHandle) { $0
                .handle()
                .title()
                .description()
                .images(first: 5) { $0
                    .edges { $0
                        .node { $0
                            .url()
                        }
                    }
                }
                .priceRange { $0
                    .maxVariantPrice { $0
                        .amount()
                        .currencyCode()
                    }
                    .minVariantPrice{ $0
                        .amount()
                        .currencyCode()
                    }
                }
            }
        }
        
        let productsTask = ShopifyClient.client.queryGraphWith(productsQuery) { [weak self] response, error in
            
            // Unwrap response data
            guard let data = response else {
                print("Query GraphQL error in getProductInfo")
                if let error = error {
                    print("Query GraphQL error: \(error)")
                }
                return
            }
            
            print("ProductViewModel,product data", data)
            

            guard let myProduct: Storefront.Product = data.product else { return }
            let images: [URL] = myProduct.images.edges.map {
                    $0.node.url
                }

                let product: Product = Product(
                    title: myProduct.title,
                    description: myProduct.description,
                    price: myProduct.priceRange.maxVariantPrice.amount,
                    imageUrls: images,
                    handle: myProduct.handle
                )


            DispatchQueue.main.async {
                self?.product = product
            }
        }
        productsTask.resume()
        
    } //:getProductDetail
    
}


