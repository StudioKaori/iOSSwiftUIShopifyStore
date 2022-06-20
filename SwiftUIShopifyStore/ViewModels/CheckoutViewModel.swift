//
//  CheckoutViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class CheckoutViewModel: ObservableObject{
    // MARK: - Properties
    @Published var checkout: Checkout = Checkout()
    
    // MARK: - Body
    func createCheckout() {
        // Checkout create input : https://shopify.dev/api/storefront/2022-04/input-objects/CheckoutCreateInput
        
//        let checkoutInput = Storefront.CheckoutCreateInput.create(
//            lineItems: .value([
//                Storefront.CheckoutLineItemInput.create(variantId: GraphQL.ID(rawValue: "mFyaWFu"), quantity: 5),
//                Storefront.CheckoutLineItemInput.create(variantId: GraphQL.ID(rawValue: "8vc2hGl"), quantity: 3),
//            ])
//        )
        
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

            let checkoutID = result?.checkoutCreate?.checkout?.id
            print("Checkout id : \(checkoutID)")
            guard checkoutID != nil else {
                print("Creating checkoutID error. CheckoutID is nil")
                return
            }
            self.checkout.checkoutID = checkoutID
        }
        task.resume()
    }
}
