//
//  ProductDetailDrawerView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct ProductDetailDrawerView: View {
    // MARK: - Property
    let product: Product
    @Binding var isDrawerOpen: Bool
    @Binding var isAnimating: Bool
    
    // MARK: - Body
    var body: some View {
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
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
            .frame(width: UIScreen.main.bounds.width)
            .offset(y: isDrawerOpen ? 20 : UIScreen.main.bounds.height - 250)
        }
    }
}

