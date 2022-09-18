//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI

struct HomeScreen: View {
    // MARK: - property
    
    // MARK: - Body
    var body: some View {
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
                    .padding(.bottom, 40)
                
                NavigationLink(destination: ProductDetailScreen(), label: {
                    Text("See the sample product")
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
