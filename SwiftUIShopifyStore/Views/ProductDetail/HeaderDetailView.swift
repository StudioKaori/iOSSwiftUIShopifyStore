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
            Text("Protective gear")
            
            Text(productTitle)
                .font(.largeTitle)
                .fontWeight(.black)
            
        } //: Vstack
        .foregroundColor(.white)
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
