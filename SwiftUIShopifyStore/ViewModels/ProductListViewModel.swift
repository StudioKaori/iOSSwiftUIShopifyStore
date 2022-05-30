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
    
    func getProducts(numbersOfProducts: Int32, completion: @escaping()->Void){
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
        
        let productsTask = ShopifyClient.client.queryGraphWith(productsQuery) { response, error in
            
            // Unwrap response data
            guard let data = response else {
                print("jsonData error in getProductInfor")
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
                completion()
            }
            
        }
        productsTask.resume()
        
        // End of products information
    }
}

struct Product{
    var title: String
    var description: String
    var price: Decimal
    var imageUrls: [URL]
    var handle: String
    
}
