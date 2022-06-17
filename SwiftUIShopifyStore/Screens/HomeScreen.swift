//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - property
//    @StateObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()

    // MARK: - Body
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .top) {
                
                PlayerView()
                    .frame(width: UIScreen.main.bounds.width)
                    .edgesIgnoringSafeArea(.all)

                
                VStack {

                    Text("KAORI")
                        .font(Font.logoFont(size: 88))
                    
                    Spacer()
                    
                    Text("NEW LOOK")
                        .font(Font.logoFont(size: 40))
                    
                    Text("Reward yourself!")
                        .font(Font.logoFont(size: 16))
                    
//                    Text(shopInfoViewModel.shopInfo.name)
//                        .font(Font.logoFont(size: 18))
//                        .padding()
                    
                    //ProductListScreen()

                } //: VStack
//                .onAppear{
//                    shopInfoViewModel.getShopInfo()
//                }
            } //: Zstack
            
        } //: NavigationView
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button(action: {}) {
                    Image(systemName: "house")
                }
                .foregroundColor(Color.black)
                
                Spacer()
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                }
                .foregroundColor(Color.black)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "cart")
                }
                .foregroundColor(Color.black)
            }
        } //: toolbar
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
