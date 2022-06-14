//
//  ShopInfoViewModel.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import Foundation
import SwiftUI
import MobileBuySDK

class ShopInfoViewModel: ObservableObject{
    @Published var shopInfo: ShopInfo = ShopInfo(name: "")
    
    func getShopInfo(completion: @escaping()->Void) {
        //static func getShopInfo(completion: @escaping(ShopInfoResult)->Void) {
        // Shop information
        let query = Storefront.buildQuery { $0
            .shop { $0
                .name()
                .moneyFormat()
                .refundPolicy { $0
                    .title()
                    .url()
                }
            }
        }

        let task = ShopifyClient.client.queryGraphWith(query) { [weak self] response, error in
            
            guard let data = response else {
                print("Query GraphQL error in getShopInfo")
                if let error = error {
                    print("Query GraphQL error \(error)")
                }
                return
            }
            
            let shopInfo: ShopInfo = ShopInfo(name: data.shop.name)
            
            DispatchQueue.main.async {
                self?.shopInfo = shopInfo
                print("Shop info: \(shopInfo)")
                completion()
            }   

        }
        task.resume()
    }
}

