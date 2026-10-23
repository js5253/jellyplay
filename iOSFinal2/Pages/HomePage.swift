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
    @EnvironmentObject var jellyfinService: JellyfinService
    @State private var selectedTab: Tabs = .watchNow
    @State private var libraries: [Library] = [
        
    ]
    ;
    @State private var continueWatching: [MediaItem] = [
        MediaItem(name: "AAAAA", itemType: MediaType.Movie, id: "ABC"),
         MediaItem(name: "BCD", itemType: MediaType.Movie, id: "ABC"),
         MediaItem(name: "DEF", itemType: MediaType.Movie, id: "ABC")

    ];
    @State private var nextUp: [MediaItem] = [
        MediaItem(name: "AAAAA", itemType: MediaType.Movie, id: "ABC"),
         MediaItem(name: "BCD", itemType: MediaType.Movie, id: "ABC"),
         MediaItem(name: "DEF", itemType: MediaType.Movie, id: "ABC")
        
    ];
    @State private var latestItems: [MediaItem] = [];
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Watch Now").font(.title).bold().padding()
            MultiItemHero(items:
                            [MediaItem(name: "AAAAA", itemType: MediaType.Movie, id: "ABC"),
                             MediaItem(name: "BCD", itemType: MediaType.Movie, id: "ABC"),
                             MediaItem(name: "DEF", itemType: MediaType.Movie, id: "ABC")
                            ]
            )
            ScrollView {
                VStack {
                    Text("View All Libraries").font(.headline)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15, style: .continuous))
                .glassEffect()
                .padding()
                    ItemSection(heading: "Continue Watching", items: continueWatching)
                    ItemSection(heading: "Next Up", items: nextUp)
                DieView()
            }
        }.task {
            do {
                libraries = try await jellyfinService.getLibraries()
                nextUp = try await jellyfinService.getNextUp()
                continueWatching = try await jellyfinService.getContinueWatching()
                for library in libraries {
                    try await latestItems += jellyfinService.getLibrary(parentId: library.id);
                }
            } catch {
                print("ERROR ERROR ERROR")
            }
        }
    }

}

#Preview {
    HomePage()
        .environmentObject(JellyfinService.shared)
    
}
