//
//  VideoPlayerView.swift
//  downloaderApp
//
//  Created by Abbas on 26/04/2024.
//

//import SwiftUI
//import UIKit
//import AVKit
//
//struct VideoPlayerView: UIViewRepresentable {
//    var url: URL
//
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView(frame: .zero)
//
//        // Create an AVPlayer and associate it with AVPlayerLayer
//        let player = AVPlayer(url: url)
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.videoGravity = .resizeAspect
//
//        // Add the player layer to the UIView's layer
//        view.layer.addSublayer(playerLayer)
//        context.coordinator.playerLayer = playerLayer
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        context.coordinator.playerLayer.frame = uiView.bounds
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    class Coordinator: NSObject {
//        var playerLayer: AVPlayerLayer
//        var parent: VideoPlayerView
//
//        init(_ parent: VideoPlayerView) {
//            self.parent = parent
//            self.playerLayer = AVPlayerLayer()
//        }
//    }
//}



//import SwiftUI
//import AVKit
//
//struct VideoPlayerView: UIViewControllerRepresentable {
//    var url: URL
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let controller = AVPlayerViewController()
//        controller.player = AVPlayer(url: url)
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//        // Optionally handle updates
//    }
//}



import SwiftUI
import AVKit
//
//struct VideoPlayerView: UIViewControllerRepresentable {
//    var url: URL
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let player = AVPlayer(url: url)
//        let controller = AVPlayerViewController()
//        controller.player = player
//        return controller
//    }
//    
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
//        // This function can be left empty if no update logic is needed
//    }
//}



struct VideoPlayerView: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: url)
        let controller = AVPlayerViewController()
        controller.player = player
        player.play() // Optionally start playing automatically
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // uiViewController.player?.play() // Optionally control playback here
    }
}

