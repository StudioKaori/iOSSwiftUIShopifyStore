//
//  CheckoutViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class CheckoutInfo {
    // MARK: - Properties
    //@Published var checkoutId: GraphQL.ID = GraphQL.ID(rawValue: "")
    @EnvironmentObject var cartItems: CartItems
    
    // MARK: - Body
    func createCheckout() {
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

        let task = ShopifyClient.client.mutateGraphWith(mutation) { [weak self] result, error in
            guard error == nil else {
                // handle request error
                print("Creating checkoutID error.")
                return
            }

            guard let userError = result?.checkoutCreate?.userErrors else {
                // handle any user error
                return
            }

            let checkoutID = result?.checkoutCreate?.checkout?.id
            
            if checkoutID == nil {
                print("Creating checkoutID error. CheckoutID is nil")
                return
            } else {
                DispatchQueue.main.async {
                    self?.cartItems.checkoutId = checkoutID!
                    print("Checkout id : \(self?.cartItems.checkoutId)")
                }
                
            }
            
        }
        task.resume()
    }
}
