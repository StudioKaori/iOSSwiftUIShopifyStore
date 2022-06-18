//
//  AddToCartButtonView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-18.
//

import SwiftUI

struct AddToCartButtonView: View {
    var body: some View {
        Button(action: {
            
        }, label: {
          Spacer()
          Text("Add to cart".uppercased())
                .font(.logoFont(size: 20))
            .fontWeight(.bold)
            .foregroundColor(.white)
          Spacer()
        }) //: BUTTON
        .padding(15)
        .background(.black)
        .clipShape(Capsule())
    }
}

struct AddToCartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartButtonView()
    }
}
