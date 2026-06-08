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
    @State private var latestItems: [MediaItem] = [];
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Watch Now").font(.title).bold().padding()
            MultiItemHero(items:
                continueWatching + nextUp
            )
            ScrollView {
                if (!continueWatching.isEmpty) {
                    ItemSection(heading: "Continue Watching", items: continueWatching)
                }
                if (!nextUp.isEmpty) {
                    
                    ItemSection(heading: "Next Up", items: nextUp)
                }
            }
        }.task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
                nextUp = try await JellyfinService.shared.getNextUp()
                continueWatching = try await JellyfinService.shared.getContinueWatching()
                for library in libraries {
                    try await latestItems += JellyfinService.shared.getLibrary(parentId: library.id);
                }
//                try await JellyfinService.shared.getWatchlist()
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
