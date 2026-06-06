//
//  SettingsPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct SearchPage: View {
    @State() var searchText: String = ""
    @State private var selectedLibrary: Season = .one
    @State private var libraries: [Library] = [];
    var recentSearches:  [RecentSearch] = []

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Search", text: $searchText)
                Picker("Libraries to Search", selection: $selectedLibrary) {
                    Text("All Libraries")
                    ForEach(libraries) {
                        library in
                        Text(library.name)
                    }
                }
            }
            if searchText == "" {
                Text("Recent Searches").font(.title)
                Label("'Icon'", systemImage: "magnifyingglass")
                ForEach(recentSearches) {
                    search in
                    SearchRow(title: search.title, subtitle: search.subtitle)
                }
                Divider()

            } else {
                Grid {
                    GridRow {
                        Text("Hello")
                        Image(systemName: "globe")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                    GridRow {
                        Image(systemName: "hand.wave")
                        Text("World")
                    }
                }

            }

        }
        
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(maxHeight: .infinity)
        .task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
                print(libraries)
            } catch {
                print("error")
            }

        }
    }

}
#Preview {
    SearchPage()
}
