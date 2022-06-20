//
//  AddToCartViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class AddToCartViewModel: ObservableObject {
    @EnvironmentObject var cartItems: CartItems
    
    func addToCart(variantID: GraphQL.ID) {
        
        let lineItem = Storefront.CheckoutLineItemInput.create(quantity: 1, variantId: variantID)
        
        let mutation = Storefront.buildMutation { $0
            .checkoutLineItemsAdd(lineItems: [lineItem], checkoutId: cartItems.checkoutId) { $0
                .checkout { $0
                    .id()
                    
                    .lineItems(first: 30) { $0
                        .edges { $0
                            .node { $0
                                .id()
                                .quantity()
                                .title()
                                .variant({_ in
                                    
                                })
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
