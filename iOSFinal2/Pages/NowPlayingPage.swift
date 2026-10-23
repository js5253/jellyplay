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
                    do {
                        let url = try await JellyfinService.shared.getPlaybackUrl(itemId: item.id)// URL to local or remote media.
                        print(url)
                        player = AVPlayer(url: url)
                        player?.addPeriodicTimeObserver(forInterval: .init(seconds: 5.0, preferredTimescale: 1), queue: .global(), using: {time in
                            print("Reporting Item Progress: \(time)")
                            
                        })

                    } catch {
                        ErrorService.shared.handleError(description: error, fatal: true)
                    }
                }
            }
        .background(Color.black)
        .navigationTitle("\(item.name) - \(item.parentName)")
        .navigationBarTitleDisplayMode(.inline) // Forces a small, centered title
//        }
    }
}
#Preview {
    NowPlayingPage(item: MediaItem(name: "Madoka Magica", itemType: .Video, id: "SASASASA"))
}
