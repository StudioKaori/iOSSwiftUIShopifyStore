//
//  ImageView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-19.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage(named: "Logo")!
    
    init(withURL url: URL) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage(named: "Logo")!
            }
    }
}

