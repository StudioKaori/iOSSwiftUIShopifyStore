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
    // For drawer
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            
            // Product images
            TabView {
                ForEach(product.imageUrls, id: \.self) { imageUrl in
                    URLImage(url: imageUrl)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            //.indexViewStyle(.page(backgroundDisplayMode: .always))
            

            VStack(alignment: .leading) {
                
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
        .onAppear {
            isAnimating = true
        }
        // MARK: - Drawer
        .overlay(alignment: .top) {
            
            ZStack {
                // To occupy the space
                Color.clear
                
                VStack(spacing: 12) {
                    // drawer handle
                    Image(systemName: isDrawerOpen ?  "chevron.compact.down" : "chevron.compact.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    Text("Product detail")
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                }
            }
            .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
            .frame(width: UIScreen.main.bounds.width)
            .offset(y: isDrawerOpen ? 20 : UIScreen.main.bounds.height - 200)
            //: Vstack
            
            
        } //: drawer
        
    }
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = previewSampleProductObject
    static var previews: some View {
        ProductDetailScreen(product: previewProduct)
            .background(Color.gray)
    }
}
