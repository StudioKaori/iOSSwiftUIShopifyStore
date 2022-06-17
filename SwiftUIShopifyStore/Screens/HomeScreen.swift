//
//  HomeScreen.swift
//  SwiftUIShopifyStore
//
//  Created by Kaori Persson on 2022-06-17.
//

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}


class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Load the resource -> h
        let fileUrl = Bundle.main.url(forResource: "main-s", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct HomeScreen: View {
    // MARK: - property
    @StateObject var shopInfoViewModel: ShopInfoViewModel = ShopInfoViewModel()

    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack {
                
                GeometryReader{ geo in
                    PlayerView()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height+100)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(Color.black.opacity(0.2))
                        .blur(radius: 1)
                        .edgesIgnoringSafeArea(.all)
                }
                
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

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
