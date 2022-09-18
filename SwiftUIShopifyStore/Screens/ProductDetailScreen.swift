//
//  ProductDetailScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - Property
    var product:Product?
    var productHandle: String?
    
    private let tempProduct = Product(title: "", description: "", price: 0, imageUrls: [], handle: "")
    
    // For drawer
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    
    init(product: Product) {
        self.product = product
    }
    
    init(productHandle: String) {
        self.productHandle = productHandle
    }
    
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            // Product images
            TabView {
                ForEach(product?.imageUrls ?? tempProduct.imageUrls, id: \.self) { imageUrl in
                    ImageView(withURL: imageUrl)
                        .aspectRatio(contentMode: .fill)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .top)
            .padding(0)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // header
            HeaderDetailView(productTitle: product?.title ?? tempProduct.title)
                .padding(.top, 80)
            
            
        }  //: Zstack
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            isAnimating = true
        }
        // MARK: - Drawer
        .overlay(alignment: .top) {
            ProductDetailDrawerView(product: product ?? tempProduct, isDrawerOpen: $isDrawerOpen, isAnimating: $isAnimating)
        }
        // MARK: - Bottom menu
        .overlay(alignment: .bottom, content: {
            BottomMenuBarView(currentView: "")
        })
        .navigationBarHidden(true)
        
        
    }
    
}

struct ProductDetailScreen_Previews: PreviewProvider {
    @State static var previewProduct = previewSampleProductObject
    static var previews: some View {
        ProductDetailScreen(product: previewProduct)
            .background(Color.gray)
    }
}
