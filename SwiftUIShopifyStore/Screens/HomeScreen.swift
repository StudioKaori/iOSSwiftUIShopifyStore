//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI
import SwiftUIBamMiniPlayerLibrary

struct HomeScreen: View {
    // MARK: - property
    @StateObject private var playerStatus = PlayerStatus.shared
    @StateObject private var playerMessageHandler = PlayerMessageHandler.shared
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
       
            // Background video
            BackgroundVideoPlayerView()
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
                    .padding(.bottom, 40)
                
                NavigationLink(destination: ProductDetailScreen(productHandle: "the-lip-stick"), label: {
                    Text("See the sample product")
                })
                
                Button(action: {
                    playerStatus.isPlayerViewVisible ? PlayerWebView.shared.playerClose() :  PlayerWebView.shared.playerOpen(showID: "DIpYtdMq9TGDOLeFbY9X")
                }, label: {
                    Text(playerStatus.isPlayerViewVisible ? "Close the player" : "Open the player")

                })

                NavigationLink(destination: ProductDetailScreen(productHandle: playerMessageHandler.currentProduct.sku), isActive: $playerMessageHandler.isChildViewVisible, label: {
                    EmptyView()
                })

                
                BottomMenuBarView(currentView: "HomeScreen")
            } //: VStack
                    
            

            
        } //: Zstack
        .navigationBarTitle("Home")
        .navigationBarHidden(true)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
