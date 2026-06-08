//
//  SeasonViewer.swift
//  iOSFinal2
//
//  Created by jose on 6/8/26.
//
import SwiftUI
struct SeasonViewer: View {
    var item: MediaItem
    @State var seasons: [MediaItem]?
    @State var episodes: [MediaItem]?
    @State private var selectedSeason: String?
    var body: some View {
        Group {
            if (seasons == nil) {
                Text("No Seasons Found")
            } else {
                VStack {
                    Picker("Season", selection: $selectedSeason) {
                        ForEach(seasons!) {
                            item in
                            Text(item.name).tag(item.id)
                            
                        }
                        
                    }.pickerStyle(.segmented).fixedSize()
                    if (episodes != nil) {
                        Text("\(episodes!.count) Episodes").font(.title)
                        ForEach(episodes!) {
                            episode in
                            
                            EpisodeRow(episode: episode)
                        }

                    }
                }
                .onChange(of: selectedSeason, {
                    _, newVal in
                    Task {
                        do {
                            if let seasonId = newVal {
                                episodes = try await JellyfinService.shared.getEpisodes(showId: item.id, seasonId: seasonId)
                            }
                        } catch {
                            ErrorService.shared.handleError(description: error)
                        }
                    }
                })
            }
        }
        .onAppear {
            Task {
                do {
                    seasons = try await JellyfinService.shared.getSeasons(id: item.id)
                    selectedSeason = seasons?.first?.id
                } catch {
                    ErrorService.shared.handleError(description: error)
                }
            }
        }
    }
}

#Preview {
    SeasonViewer(item: MediaItem(name: "Madoka Magica", itemType: .Series, id: "dasdsadasdas"))
}
