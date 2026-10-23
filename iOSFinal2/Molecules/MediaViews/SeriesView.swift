//
//  MediaView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct SeriesView: View {
    var item: MediaItem
    var itemId: String?
    @State private var currentSeason: String?
    var body: some View {
        Group {
            VStack {
                Hero(item: item)
                ScrollView {
                    if (item.description != nil) {
                        Text(item.description!)
                    }
                    SeasonViewer(item: item)
//                    if (item.itemType == .Season)
                    
                    Text(String(item.itemType.rawValue)).font(.footnote).foregroundStyle(.gray)
                }.padding()
                
            }
        }
        .onAppear {
            
        }
    }

}

#Preview {
    MediaView(id: "1234")
}
