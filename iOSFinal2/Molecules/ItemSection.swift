//
//  ItemSection.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct ItemSection: View {
    var heading: String
    var items: [MediaItem]
    var body: some View {
        VStack(alignment: .leading) {
            Text(heading).font(.title2)
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {

                    ForEach(items) {
                        item in
                        NavigationLink(value: item) {
                            ZStack {
                                Text(item.name)
                            }
                            .frame(width: 100.0, height: 100.0)
                            .background(
                                Gradient(colors: [.teal, .cyan, .green]).opacity(
                                    0.6
                                )
                            ).cornerRadius(2.5)
                            
                        }
                        .navigationDestination(for: MediaItem.self) { item in
                            MediaView(id: "2")
                        }
                    }
                }
            }
        }
        .padding()
    }

}

#Preview(traits: .sizeThatFitsLayout) {
    ItemSection(
        heading: "Continue Watching",
        items: [MediaItem(name: "Happy Feet 2", itemType: .Movie, id: "1"), MediaItem(name: "Happy Feet 3", itemType: .Movie, id: "2"), MediaItem(name: "Happy Feet 4", itemType: .Movie, id: "3"), MediaItem(name: "Happy Feet 5", itemType: .Movie, id: "4")]
    )
}
