//
//  CheckoutViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class CheckoutInfo: ObservableObject {
    // MARK: - Properties
    @Published var checkoutId: GraphQL.ID = GraphQL.ID(rawValue: "")
    
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
            
            guard let strongSelf = self else {
                print("strongSelf error")
                return
            }
            
            guard let safeCheckoutId = result?.checkoutCreate?.checkout?.id as? GraphQL.ID else {
                print("Creating checkoutID error. CheckoutID is nil")
                return
            }
            
            DispatchQueue.main.async {
                strongSelf.checkoutId = safeCheckoutId
                print("Checkout id in DispatchQueue : \(strongSelf.checkoutId)")
            }
            
        }
        task.resume()
    }
}
