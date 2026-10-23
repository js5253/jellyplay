//
//  MediaView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct MovieView: View {
    var item: MediaItem
    var body: some View {
        Group {
                VStack {
                    Hero(item: item)
                    ScrollView {
                        if (item.description != nil) {
                            Text(item.description!)
                        }
                        
                        Text(String(item.itemType.rawValue)).font(.footnote).foregroundStyle(.gray)
                    }.padding()
                }
        }
    }

}

#Preview {
    MediaView(id: "1234")
}
