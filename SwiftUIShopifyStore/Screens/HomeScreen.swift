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
                GeometryReader{ geo in
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+100)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                }  //: video
                
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
