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
    var media = [MediaItem(name: "Happy Feet 2", itemType: .Movie)]
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Watch Now").font(.title).bold().padding()
            MultiItemHero(items: [
                MediaItem(name: "The Bee Movie", itemType: .Show),
                MediaItem(name: "The LEGO Movie", itemType: .Movie),
                MediaItem(name: "The Emoji Movie", itemType: .Movie),
                MediaItem(name: "CATS: The Movie", itemType: .Show),
                MediaItem(name: "Love on a Leash", itemType: .Show),
            ])
            ScrollView {
                ItemSection(heading: "Continue Watching", items: continueWatching)
                ItemSection(heading: "Next Up", items: media)
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

                ItemSection(heading: "Latest in Movies", items: media)
                ItemSection(heading: "Latest in TV Shows", items: media)

            }
        }.task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
                continueWatching = try await JellyfinService.shared.getContinueWatching()
                print(libraries)
            } catch {
                print("error")
            }
        }
    }

}

#Preview {
    HomePage()
}
