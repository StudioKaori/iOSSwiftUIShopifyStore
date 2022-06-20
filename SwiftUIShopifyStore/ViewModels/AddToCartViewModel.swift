//
//  AddToCartViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-20.
//

import SwiftUI
import MobileBuySDK

class AddToCartViewModel: ObservableObject {
    @EnvironmentObject var checkoutInfo: CheckoutInfo
    
    func addToCart(variantID: GraphQL.ID) {
        let lineItem = Storefront.CheckoutLineItemInput.create(quantity: 1, variantId: variantID)
        
        let mutation = Storefront.buildMutation { $0
            .checkoutLineItemsAdd(lineItems: [lineItem], checkoutId: checkoutInfo.checkout.checkoutID!) { $0
                .checkout { $0
                    .id()
                }
                .userErrors { $0
                    .field()
                    .message()
                }
            }
        }
    }
}
