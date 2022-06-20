//
//  AddToCartViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class AddToCartViewModel: ObservableObject {
    
    var checkoutId: GraphQL.ID = GraphQL.ID(rawValue: "")
    
    func addToCart(variantID: GraphQL.ID) {
        print("add to cart variant id: \(variantID)")
        print("add to cart checkout id: \(checkoutId)")
        
        let lineItem = Storefront.CheckoutLineItemInput.create(quantity: 1, variantId: variantID)
        
        let mutation = Storefront.buildMutation { $0
            .checkoutLineItemsAdd(lineItems: [lineItem], checkoutId: checkoutId) { $0
                .checkout { $0
                    .id()
                    
                    .lineItems(first: 30) { $0
                        .edges { $0
                            .node { $0
                                .id()
                                .quantity()
                                .title()
                            }
                        }
                    }
                }
                .userErrors { $0
                    .field()
                    .message()
                }
            }
        }
        
        let task = ShopifyClient.client.mutateGraphWith(mutation) { [weak self] result, error in
            print("Cart result; \(result)")
            guard error == nil else {
                print("Add to cart error : \(error)")
                return
            }

            guard let userError = result?.checkoutCreate?.userErrors else {
                print("Add to cart error.")
                return
            }

            let checkoutID = result?.checkoutCreate?.checkout?.id

        }
        task.resume()
    }
}
