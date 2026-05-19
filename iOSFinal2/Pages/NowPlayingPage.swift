import AVKit
//
//  NowPlayingPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI
internal import System

struct NowPlayingPage {
    @State private var player: AVPlayer?
    @State private var isPlaying = false
    var body: some View {
        VStack {
            if let player {
                VideoPlayer(player: player)
                    .frame(width: 320, height: 180, alignment: .center)

                Button {
                    isPlaying ? player.pause() : player.play()
                    isPlaying.toggle()
                    player.seek(to: .zero)
                } label: {
                    Image(systemName: isPlaying ? "stop" : "play")
                        .padding()
                }

            }
        }
        .task {
            // Use the task modifier to defer creating the player to ensure
            // SwiftUI creates it only once when it first presents the view.
            let url = URL(filePath: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")  // URL to local or remote media.
            player = AVPlayer(url: url)
        }
    }
}
#Preview {
//    NowPlayingPage()
}
