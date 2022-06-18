//
//  ProductDetailScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - Property
    var product:Product
    
    var body: some View {
        ZStack {

            
            AsyncImage(url: product.imageUrls[0], transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                case .failure(_):
                    Image(systemName: "xmark.icloud.fill").iconModifier()
                case .empty:
                    Image(systemName: "xmark.icloud.fill").iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
            
            VStack(alignment: .leading) {
                TabView {
                    Text("Hello1")
                    Text("Hello2")
                    Text("Hello3")
                            }
                .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                // header
                Spacer()
                
                HeaderDetailView(productTitle: product.title)
                    .padding(.horizontal)
                
                // detail top part
                // detail bottom part
                // ratings sizes
                // description
                // quantity + favorite
                // add to cart
                Spacer()
            }  //: Vstack

        } //: Zstack
        .ignoresSafeArea(.all, edges: .all)
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = previewSampleProductObject
    static var previews: some View {
        ProductDetailScreen(product: previewProduct)
            .background(Color.gray)
    }
}
