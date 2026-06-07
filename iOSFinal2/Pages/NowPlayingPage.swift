import AVKit
//
//  NowPlayingPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI
internal import System

struct NowPlayingPage: View {
    var item: MediaItem
    @State private var player: AVPlayer?
    @State private var isPlaying = false
    var body: some View {
        Group {
//            if (item.itemType != MediaType.Video) {
//                Text("An Error Occured")
//            } else {
                VStack {
                    if let player {
                        VideoPlayer(player: player)
                            .frame(width: .infinity, height: .infinity, alignment: .center)
                        
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
                    do {
                        let url = try await JellyfinService.shared.getPlaybackUrl(itemId: item.id)// URL to local or remote media.
                        print(url)
                        player = AVPlayer(url: url)

                    } catch {
                        print("ERROR ;-;")
                    }
                }
            }
        .background(Color.black)
//        }
    }
}
#Preview {
//    NowPlayingPage()
}
