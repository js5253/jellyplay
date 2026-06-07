//
//  MediaView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

enum Season: String, CaseIterable, Identifiable {
    case one
    var id: Self { self }
}

struct Episode: Identifiable {
    var seasonId: Int
    var name: String
    var id: Int
    var description: String?

}

var episodes: [Episode] = [Episode(seasonId: 1, name: "Episode One", id: 1)]
struct MediaView: View {
    var id: String
    @State var item: MediaItem?
    @State private var selectedSeason: Season = .one
    var body: some View {
        Group {
        if (item == nil) {
            ProgressView()
        } else {
            VStack {
                Hero(title: item!.title)
                ScrollView {
                    if (item!.description != nil) {
                        Text(item!.description!)
                    }
                    if (item!.itemType == .Show) {
                        Picker("Season", selection: $selectedSeason) {
                            Text("S1").tag(Season.one)
                            Text("S2").tag(Season.one)
                            Text("S3").tag(Season.one)
                        }.pickerStyle(.segmented).fixedSize()
                        Text("13 Episodes").font(.title)
                        ForEach(episodes) {
                            episode in
                            HStack {
                                Image(systemName: "ASSASA")
                                    .frame(height: 100.0)
                                    .frame(maxWidth: .infinity)
                                    .background(Color(UIColor.lightGray))
                                    .clipShape(.rect(cornerRadius: 6))
                                VStack {
                                    Text("S\(episode.seasonId)E\(episode.id)").font(.caption).foregroundStyle(.gray)
                                    Text(episode.name)
                                    if episode.description != nil {
                                        Text(episode.description!)
                                    }
                                }.frame(maxWidth: .infinity)
                                
                            }
                        }
                    }
                }.padding()
            }
        }
        }.task {
            do {
                print(id)
                item = try await JellyfinService.shared.getItem(id: id)
                

            } catch {
                ErrorService.shared.handleError(description: error)
            }
        }
    }
        
}

#Preview {
    MediaView(id: "1")
}
