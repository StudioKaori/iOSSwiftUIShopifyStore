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
        
        if cartItems.cartItems.count == 0 {
            Text("Your cart is empty.")
        }
        
        ScrollView {
            ForEach(cartItems.cartItems) { product in
                
                HStack(alignment: .top, spacing: 4) {
                    
                    NavigationLink(destination: ProductDetailScreen(product: product)) {
                        URLImage(url: product.imageUrls[0])
                            .frame(width: 100, height: 100)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text(product.title)
                            .foregroundColor(.black)
                            .font(.logoFont(size: 24))
                        
                        Spacer()
                        
                        HStack(alignment: .top) {
                            
                            Button(action: {
                                if (cartItems.quantityOfCartItems[product.handle] ?? 0) - 1 != 0 {
                                    cartItems.quantityOfCartItems.updateValue((cartItems.quantityOfCartItems[product.handle] ?? 0) - 1, forKey: product.handle)
                                }
                            }, label: {
                                Image(systemName: "minus.circle")
                            })
                            
                            Text("\(cartItems.quantityOfCartItems[product.handle] ?? 0)")
                            
                            Button(action: {
                                cartItems.quantityOfCartItems.updateValue((cartItems.quantityOfCartItems[product.handle] ?? 0) + 1, forKey: product.handle)
                            }, label: {
                                Image(systemName: "plus.circle")
                            })
                            
                            
                            Spacer()
                            
                            Button(action: {
                                cartItems.cartItems.removeAll(where: { $0 == product })
                                cartItems.quantityOfCartItems.removeValue(forKey: product.handle)
                                cartItems.setTotalNumbersOfItems()
                            }, label: {
                                Image(systemName: "trash")
                            })

                        }
                        .font(.logoFont(size: 24))
                        .foregroundColor(Color.gray)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 0)
                    }
                    
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 6)
                //: Hstack
                
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
