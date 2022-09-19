//
//  ProductDetailScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-05-31.
//

import SwiftUI

struct ProductDetailScreen: View {
    // MARK: - Property
    @StateObject var productViewModel = ProductViewModel()
    @State private var product: Product = Product(title: "", description: "", price: 0, imageUrls: [], handle: "")
    
    var productHandle: String = ""
    
    // For drawer
    @State private var isAnimating: Bool = false
    @State private var isDrawerOpen: Bool = false
    
    
    // MARK: - Initialiser
    init(product: Product) {
        _product = State(initialValue: product)
    }

    init(productHandle: String) {
        self.productHandle = productHandle
    }

    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            Color.clear
            
            // Product images
            
            if((productHandle == "" ? product.imageUrls.count : productViewModel.product.imageUrls.count) != 0) {
                TabView {
                    ForEach((productHandle == "" ? product.imageUrls : productViewModel.product.imageUrls), id: \.self) { imageUrl in
                        ImageView(withURL: imageUrl)
                            .aspectRatio(contentMode: .fill)
                    }
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .top)
                    .padding(0)
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
            } else {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 250, maxHeight: 250)
                    .foregroundColor(.gray)
            }
            
            
            
            // header
            HeaderDetailView(productTitle: productHandle == "" ? product.title : productViewModel.product.title)
                .padding(.top, 80)
            
            
        }  //: Zstack
        .ignoresSafeArea(.all, edges: .all)
        .onAppear {
            isAnimating = true
        }
        // MARK: - Drawer
        .overlay(alignment: .top) {
            ProductDetailDrawerView(product: (productHandle == "" ? product : productViewModel.product), isDrawerOpen: $isDrawerOpen, isAnimating: $isAnimating)
        }
        // MARK: - Bottom menu
        .overlay(alignment: .bottom, content: {
            BottomMenuBarView(currentView: "")
        })
        .navigationBarHidden(true)
        .onAppear() {
            if (self.productHandle != "") {
                productViewModel.getProductDetail(productHandle: self.productHandle)
            }
            
        }
    }
    
    
}

//struct ProductDetailScreen_Previews: PreviewProvider {
//    @State static var previewProduct = previewSampleProductObject
//    static var previews: some View {
//        ProductDetailScreen(product: previewProduct)
//            .background(Color.gray)
//    }
//}
