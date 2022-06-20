//
//  CreateCheckoutIdViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class CreateCheckoutIdViewModel {
    
    func createCheckout(completion: @escaping (GraphQL.ID) -> Void) {
        // Checkout create input : https://shopify.dev/api/storefront/2022-04/input-objects/CheckoutCreateInput
        // SDK instruction: https://github.com/Shopify/mobile-buy-sdk-ios/#checkout-
        
        let checkoutInput = Storefront.CheckoutCreateInput.create(
            note: .value("iOS app anonymous user")
        )

        let mutation = Storefront.buildMutation { $0
            .checkoutCreate(input: checkoutInput) { $0
                .checkout { $0
                    .id()
                }
                .userErrors { $0
                    .field()
                    .message()
                }
            }
        }

        let task = ShopifyClient.client.mutateGraphWith(mutation) { result, error in
            guard error == nil else {
                // handle request error
                print("Creating checkoutID error.")
                return
            }

            guard let userError = result?.checkoutCreate?.userErrors else {
                // handle any user error
                return
            }
            
            guard let safeCheckoutId = result?.checkoutCreate?.checkout?.id as? GraphQL.ID else {
                print("Creating checkoutID error. CheckoutID is nil")
                return
            }
            
            completion(safeCheckoutId)
            
        }
        task.resume()
    }
}
