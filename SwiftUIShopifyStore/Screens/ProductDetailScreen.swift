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
        ZStack(alignment: .top) {
            Color.clear
            
            // Product images
            TabView {
                ForEach(product.imageUrls, id: \.self) { imageUrl in
                    URLImage(url: imageUrl)
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .top)
            .padding(0)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            // header
            HeaderDetailView(productTitle: product.title)
                .padding(.top, 80)
               
            
        }  //: Zstack
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
                        .frame(width: 20)
                        .padding(4)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    HStack {
                        Text(product.title)
                            .foregroundColor(.black)
                            .font(.logoFont(size: 18))
                        
                        Spacer()
                        
                        Text("$\(product.price)" as String)
                            .foregroundColor(.black)
                            .font(.logoFont(size: 14))
                    }
                    .padding(.horizontal,6)
                    
                    
                    AddToCartButtonView()
                        .padding(.bottom, 30)
                    
                    if isDrawerOpen {
                        VStack {
                            Divider()
                            Text("Product details:")
                            Text(product.description)
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
            .frame(width: UIScreen.main.bounds.width)
            .offset(y: isDrawerOpen ? 20 : UIScreen.main.bounds.height - 250)
            //: Vstack

        } //: drawer
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
