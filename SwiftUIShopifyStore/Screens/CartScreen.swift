//
//  CartScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject var cartItems: CartItems
    
    var body: some View {
        VStack {
            Text("Cart")
            
            ForEach(cartItems.cartItems) { product in
                NavigationLink(destination: ProductDetailScreen(product: product)) {
                    HStack {
                        URLImage(url: product.imageUrls[0])
                        .frame(width: 70, height: 70)
                        .background(Color.gray)
                        .cornerRadius(4)
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(product.title)
                                .bold()
                            
                            HStack {
//                                Text(tvShow.show.premiered?.prefix(4).appending(" -") ?? "")
//                                    .font(.footnote)
//
//                                Text(tvShow.show.ended?.prefix(4) ?? "")
//                                    .font(.footnote)
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                                
                                Text("\(cartItems.quantityOfCartItems[product.handle] ?? 0)")
                                    .font(.footnote)
                            }
                        }

                    }
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 6)
                 //: navigation link
                
            } //: foreach
        } //: Vstack
                    
    }
}

struct CartScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}
