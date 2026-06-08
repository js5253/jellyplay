//
//  SettingsPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct SearchPage: View {
    @State() var searchText: String = ""
    @State() var items: [MediaItem] = []
    @State private var selectedLibrary: String?
    @State private var libraries: [Library] = [];

    var body: some View {
        VStack() {
            HStack {
                TextField("Search", text: $searchText)
            }
                Grid {
                    ForEach(items) {
                        media in
                        NavigationLink {
                            MediaView(id: media.id)
                        } label: {
                            SearchRow(title: media.name, subtitle: media.parentName, mediaType: media.itemType)
                        }
                    }

            }

        }
        
        
        .padding()
        .textFieldStyle(.roundedBorder)
        .frame(maxHeight: .infinity, alignment: .top)
        .onChange(of: searchText, {
            oldVal, newVal in
            Task {
                items = try await JellyfinService.shared.search(query: searchText, libraries: [])
            }
        })
        .task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
                print(libraries)
            } catch {
                ErrorService.shared.handleError(description: error)
            }

        }
        
    }

}
#Preview {
    SearchPage()
}
