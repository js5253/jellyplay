//
//  MediaView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct MediaView: View {
    var id: String
    @State private var item: MediaItem?
    @State private var subId: String?
    @State private var loading = true
    var body: some View {
        Group {
            if (loading) {
                ProgressView()
            } else {
                if (item == nil) {
                    Text("Item Not Found")
                } else {
                    switch(item!.itemType) {
                    case MediaType.Movie:
                        MovieView(item: item!)
                    case MediaType.Series, MediaType.Season, MediaType.Episode:
                        SeriesView(item: item!, itemId: subId)
                    default:
                        Text(":/")
                    }
                }
            }
        }
        .task {
            do {
                item = try await JellyfinService.shared.getItem(id: id)
                
                if (item?.itemType == .Season) {
                    // try to get the parent item here
                        
                } else if (item?.itemType == .Episode) {
                    subId = item?.id
                    item = try await JellyfinService.shared.getItem(id: item!.seriesId!)
                }
                loading = false
            }
            catch {
                ErrorService.shared.handleError(description: error)
            }
        }
    }
        
}

#Preview {
    MediaView(id: "1234")
}
