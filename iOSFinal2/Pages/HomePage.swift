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
    @State private var selectedTab: Tabs = .watchNow
    var media = [MediaItem(name: "Happy Feet 2")]
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            MultiItemHero(items: [
                MediaItem(name: "The Bee Movie"),
                MediaItem(name: "The LEGO Movie"),
                MediaItem(name: "The Emoji Movie"),
                MediaItem(name: "CATS: The Movie"),
                MediaItem(name: "Love on a Leash"),
            ])
            ScrollView {
                ItemSection(heading: "Continue Watching", items: media)
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
        }
    }

}

#Preview {
    HomePage()
}
