//
//  LoginPage.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//
import SwiftUI

struct MediaItem: Identifiable, Hashable {
    let name: String
    var id: String { name }
}
enum Tabs: Equatable, Hashable, Identifiable {
    var id: Self { return self }

    case watchNow
    case search
    case settings
}

struct HomePage: View {
    @State private var selectedTab: Tabs = .watchNow
    var media = [MediaItem(name: "Happy Feet 2")]
    let rows = [GridItem(.fixed(30)), GridItem(.fixed(30))]
    var body: some View {
        VStack(alignment: .leading) {
            Hero(title: "ASSASA")
            ScrollView {
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Next Up", items: media)
                VStack {
                    Text("Looking for something new?").font(.title2)
                    HStack {
                        ScrollView {
                            Button("Random Watchlist", action: {})
                            Text("or...")
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                            Button("{ITEM 1}", action: {})
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .frame(height: 200.0)
                    .background(
                        Gradient(colors: [.white, .teal, .white]).opacity(
                            0.6
                        )
                    )

                ItemSection(heading: "Latest in Movies", items: media)
                ItemSection(heading: "Latest in TV Shows", items: media)

            }
        }
    }

}

#Preview {
    HomePage()
}
