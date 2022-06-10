//
//  ProductListViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import Foundation
import SwiftUI
import MobileBuySDK
import Combine

class ProductListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var products: [Product] = []
    
    private var cancellables: [AnyCancellable] = []
    
    // Cancel all subscription at the timing of deinit
    deinit {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
    }
    
    
    // MARK: - Methods
    func getProducts(numbersOfProducts: Int32){
        var products: [Product] = []
        // products information
        // https://shopify.dev/api/storefront/2022-04/queries/products
        // product field : https://shopify.dev/api/storefront/2022-04/objects/Product#fields
        let productsQuery = Storefront.buildQuery { $0
            .products(first: numbersOfProducts) { $0
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
                print("jsonData error in getProductInfo")
                return
            }
            
            for item in data.products.edges {
                
                var images: [URL] = []
                for image in item.node.images.edges {
                    let productImageUrl = image.node.url
                    images.append(productImageUrl)
                }
                
                let product: Product = Product(
                    title: item.node.title,
                    description: item.node.description,
                    price: item.node.priceRange.maxVariantPrice.amount,
                    imageUrls: images,
                    handle: item.node.handle
                )
                products.append(product)
            }
            print("Product View Model : \(products)")
            self?.products = products
        }
        productsTask.resume()
        
    } //:getProducts
}

