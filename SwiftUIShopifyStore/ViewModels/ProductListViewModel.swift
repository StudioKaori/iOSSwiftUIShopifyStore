//
//  ProductListViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import Foundation
import SwiftUI
import MobileBuySDK

/// ViewModel for getting Product information from Shopify backend.
class ProductListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var products: [Product] = []
    
    // MARK: - Methods
    /// Get product information from Shopify backend.
    ///  To specify the category, set 'tag:tagname' in the query parameter.
    func getProducts(numbersOfProducts: Int32, query: String = "") {
        // products information
        // https://shopify.dev/api/storefront/2022-04/queries/products
        // product field : https://shopify.dev/api/storefront/2022-04/objects/Product#fields
        // buy sdk: https://github.com/Shopify/mobile-buy-sdk-ios/
        let productsQuery = Storefront.buildQuery { $0
            .products(first: numbersOfProducts, query: query) { $0
                .edges { $0
                    .node { $0
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
            
            let products: [Product] = data.products.edges.map {
                let images: [URL] = $0.node.images.edges.map {
                    $0.node.url
                }
                
                let product: Product = Product(
                    title: $0.node.title,
                    description: $0.node.description,
                    price: $0.node.priceRange.maxVariantPrice.amount,
                    imageUrls: images,
                    handle: $0.node.handle
                )
                
                return product
            }
            
            //print("Product View Model : \(products)")
            DispatchQueue.main.async {
                self?.products = products
            }
        }
        productsTask.resume()
        
    } //:getProducts
    
}

