//
//  LibraryView.swift
//  iOSFinal2
//
//  Created by jose on 6/8/26.
//
import SwiftUI
struct LibraryView : View {
    @State var libraries: [Library]?
    @State private var selectedLibrary: String?
    @State var items: [MediaItem]?
    
    var body: some View {
        VStack {
            Picker("Libraries to Search", selection: $selectedLibrary) {
                Text("All Libraries")
                if (libraries != nil) {
                    ForEach(libraries!) {
                        library in
                        Text(library.name)
                    }
                }
            }
            if (items != nil) {
                ForEach(items!) {
                    item in
                    Text(item.name)
                }
            }
    }
        .task {
            do {
                libraries = try await JellyfinService.shared.getLibraries()
            } catch {
                ErrorService.shared.handleError(description: error)
            }
        }
        .onChange(of: selectedLibrary, {
            _, newVal in
            Task {
                do {
                    if let galleryId = newVal {
                        items = try await JellyfinService.shared.getLibrary(parentId: galleryId);
                        print("Got Library Contents")
                    }
                } catch {
                    ErrorService.shared.handleError(description: error)
                }
            }
        })

    }
        
}
