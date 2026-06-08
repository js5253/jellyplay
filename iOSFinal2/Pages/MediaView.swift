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
    @State private var loading = true
    var body: some View {
        Group {
            if (loading) {
                ProgressView()
            } else {
                if (item == nil) {
                    Text("Item Not Found")
                } else {
                    VStack {
                        Hero(item: item!)
                        ScrollView {
                            if (item!.description != nil) {
                                Text(item!.description!)
                            }

                            if (item!.itemType == .Series) {
                                SeasonViewer(item: item!)
                            }
                            Text(String(item!.itemType.rawValue)).font(.footnote)
                        }.padding()
                    }
                }
            }
        }
        .task {
            do {
                item = try await JellyfinService.shared.getItem(id: id)
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
