//
//  LoginPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

enum Tabs: Equatable, Hashable, Identifiable {
    var id: Self { return self }

    case watchNow, search, settings, watchlist
}

struct HomePage: View {
    ///TODO: make this more modular
    @State private var selectedTab: Tabs = .watchNow
    @State private var libraries: [Library] = [];
    @State private var continueWatching: [MediaItem] = [];
    @State private var nextUp: [MediaItem] = [];
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Watch Now").font(.title).bold().padding()
            MultiItemHero(items:
                continueWatching + nextUp
            )
            ScrollView {
                ItemSection(heading: "Continue Watching", items: continueWatching)
                ItemSection(heading: "Next Up", items: nextUp)
                VStack {
                    Text("Looking for something new?").font(.title2)
                    HStack {
                        ScrollView {
                            Button(action: {}) {
                                    Label("Random Watchlist Item", systemImage: "die.face.5")
                                }
                            .buttonStyle(.glassProminent)

                            Text("or...")
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                        }
                    }
                }
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16.0))
                ForEach(libraries) {
                    library in
                    ItemSection(heading: "Latest in \(library.name)", items: [])

                }

            }
        }.task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
                nextUp = try await JellyfinService.shared.getNextUp()
                continueWatching = try await JellyfinService.shared.getContinueWatching()
                try await JellyfinService.shared.getWatchlist()
            } catch {
                print(error)
            }
        }
    }

}

#Preview {
    HomePage()
        .environmentObject(JellyfinService.shared)
    
}
