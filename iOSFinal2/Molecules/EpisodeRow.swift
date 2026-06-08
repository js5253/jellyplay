//
//  EpisodeRow.swift
//  iOSFinal2
//
//  Created by jose on 6/8/26.
//
import SwiftUI
struct EpisodeRow: View {
    var episode: MediaItem
    var body: some View {
        NavigationLink(destination: NowPlayingPage(item: episode)) {
            HStack {
                Image(systemName: "ASSASA")
                    .frame(height: 100.0)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.lightGray))
                    .clipShape(.rect(cornerRadius: 6))
                VStack {
                    Text("S\(episode.parentIndexNumber! )E\(episode.indexNumber!)").font(.caption).foregroundStyle(.gray)
                    Text(episode.name)
                    if episode.description != nil {
                        Text(episode.description!).font(.caption).foregroundStyle(.gray)
                    }
                }.frame(maxWidth: .infinity)
                
            }
            .padding()
        }
    }
}

#Preview {
    EpisodeRow(episode: MediaItem(name: "Episode 1", itemType: .Episode, id: "AAASASSA"))
}
