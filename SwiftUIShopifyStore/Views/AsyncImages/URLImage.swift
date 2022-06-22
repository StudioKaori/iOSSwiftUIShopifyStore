//
//  URLImage.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct URLImage: View {
    
    let url: URL
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        }else {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 250, maxHeight: 250)
                .foregroundColor(.gray)
                .onAppear {
                    fetchData()
                }
        }

    }
    
    private func fetchData() {
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            self.data = data
        })
        task.resume()
    }
}


