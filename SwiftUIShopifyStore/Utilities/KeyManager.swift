//
//  KeyManager.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-30.
//

import Foundation

/// To retrieve the api key from the apikey from apikey. plist
struct KeyManager {

    private let keyFilePath = Bundle.main.path(forResource: "apikey", ofType: "plist")

    func getKeys() -> NSDictionary? {
        guard let keyFilePath = keyFilePath else {
            return nil
        }
        return NSDictionary(contentsOfFile: keyFilePath)
    }

    func getValue(key: String) -> AnyObject? {
        guard let keys = getKeys() else {
            return nil
        }
        return keys[key]! as AnyObject
    }
}
