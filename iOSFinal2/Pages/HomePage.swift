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
    var body: some View {
        VStack(alignment: .leading) {
            Hero(title: "ASSASA")
            ScrollView {
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Continue Watching", items: media)
                ItemSection(heading: "Continue Watching", items: media)
            }
        }
    }

}

#Preview {
    HomePage()
}
