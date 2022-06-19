//
//  HeaderDetailView.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-14.
//

import SwiftUI

struct HeaderDetailView: View {
    // MARK: - Property
    var productTitle: String

    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text(productTitle)
                .font(.logoFont(size: 40))
                .kerning(-4)
            
        } //: Vstack
        .foregroundColor(.black)
    }
}

struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView(productTitle: "Product name")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}
