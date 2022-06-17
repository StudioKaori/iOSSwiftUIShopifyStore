//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - property
    @StateObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()

    // MARK: - Body
    var body: some View {
        NavigationView {
            
            ZStack {
                
                PlayerView()
                    .frame(width: UIScreen.main.bounds.width)
                    .edgesIgnoringSafeArea(.all)

                
                VStack {

                    Text("KAORI")
                        .font(Font.logoFont(size: 88))
                    
                    Text(shopInfoViewModel.shopInfo.name)
                        .font(Font.logoFont(size: 18))
                        .padding()
                    
                    ProductListScreen()

                } //: VStack
                .onAppear{
                    shopInfoViewModel.getShopInfo()
                }
            }
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
