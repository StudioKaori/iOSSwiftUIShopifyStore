//
//  CartItemsView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-19.
//

import SwiftUI

struct CartItemsView: View {
    @EnvironmentObject var cartItems: CartItems
    
    var body: some View {
        ScrollView {
            ForEach(cartItems.cartItems) { product in
                NavigationLink(destination: ProductDetailScreen(product: product)) {
                    HStack(alignment: .top, spacing: 4) {
                        URLImage(url: product.imageUrls[0])
                        .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(product.title)
                                .foregroundColor(.black)
                                .font(.logoFont(size: 24))
                            
                            Spacer()
                            
                            HStack(alignment: .top) {
                                
                                Button(action: {
        
                                }, label: {
                                  Image(systemName: "minus.circle")
                                })
                                
                                Text("\(cartItems.quantityOfCartItems[product.handle] ?? 0)")
                                
                                Button(action: {

                                }, label: {
                                  Image(systemName: "plus.circle")
                                })
                                
                                
                                Spacer()
                                
                                Image(systemName: "trash")
                                    
                                
                            }
                            .font(.logoFont(size: 24))
                            .foregroundColor(Color.gray)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 0)
                        }

                    }
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 6)
                 //: navigation link
                
                Divider()
                
            } //: foreach
        }
    }
}

struct CartItemsView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemsView()
    }
}
