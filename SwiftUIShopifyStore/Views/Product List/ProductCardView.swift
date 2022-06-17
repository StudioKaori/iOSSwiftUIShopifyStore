//
//  ProductCardView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .padding(.vertical, 10)
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            //.frame(maxWidth: 128)
            .scaledToFit()
            .foregroundColor(.gray)
            .opacity(0.5)
            .padding(10)
    }
}

struct ProductCardView: View {
    // MARK: - Property
    let product: Product
    
    // MARK: - Body
    var body: some View {
        NavigationLink(destination: ProductDetailScreen(product: product)) {
            VStack(alignment: .leading, spacing: 6, content: {
                // photo
                ZStack {
                    AsyncImage(url: product.imageUrls[0],
                               transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                        switch phase {
                        case .success(let image):
                            image.imageModifier()
                            
                                .transition(.move(edge: .bottom))
                        case .failure(_):
                            Image(systemName: "xmark.icloud.fill").iconModifier()
                        case .empty:
                            Image(systemName: "photo.circle.fill").iconModifier()
                        @unknown default:
                            ProgressView()
                        }
                    }
                    
                }
                
                // name
                Text(product.title)
                    .font(Font.logoFont(size: 18))
                    .foregroundColor(.black)
                // price
                Text("$\(product.price)" as String)
                    .font(Font.logoFont(size: 14))
                    .foregroundColor(.gray)
            }) //: VStack
        } //: Navigation link
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: previewSampleProductObject)
            .previewLayout(.fixed(width: 200, height: 300))
            .padding()
    }
}
