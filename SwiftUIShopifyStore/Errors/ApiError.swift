//
//  ApiError.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-22.
//

import Foundation

struct ApiError: LocalizedError {
    var responseError: String? {
            return "Couldn't get data from the server. Please try again."
        }
}
