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
        VStack {
            ScrollView(.horizontal, showsIndicators: true) {
                Text(heading).font(.title2)
                List {
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
                            MediaView(item: item)
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
        heading: "AAAA",
        items: [MediaItem(name: "Happy Feet 2")]
    )
}
