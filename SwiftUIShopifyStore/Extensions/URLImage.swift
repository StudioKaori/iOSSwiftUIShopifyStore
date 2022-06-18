//
//  URLImage.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct URLImage: View {
    
    let urlString: String
    
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        }else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    fetchData()
                }
        }

    }
    
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            self.data = data
        })
        task.resume()
    }
}


