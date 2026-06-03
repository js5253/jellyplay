//
//  ContentView.swift
//  iOSFinal2
//
//  Created by jose on 5/19/26.
//

import SwiftUI

enum RootNavigationDestination {
    case loading, loginPage, homePage
    
}
struct RootLoggedInView: View {
    @State private var selectedTab: Tabs = .watchNow

    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "play", value: .watchNow) {
                    HomePage()
                }
                Tab("Search", systemImage: "gear", value: .search) {
                    SearchPage()
                }
                Tab("Watchlist", systemImage: "bookmark", value: .watchlist) {
                    WatchlistPage()
                }
                Tab("Settings", systemImage: "magnifyingglass", value: .settings) {
                    SettingsPage()
                }
            }
        }
    }
}


struct ContentView: View {
//    @State var currentView: RootNavigationDestination;
    @EnvironmentObject var jellyfinService: JellyfinService
    var body: some View {
        Group {
            switch(jellyfinService.isLoading) {
            case true:
                ProgressView("Loading...")
                    .progressViewStyle(.circular) // Ensures a circular spinner
                    .tint(.blue)                  // Changes the spinner color
                    .controlSize(.large)          // Makes the spinner larger (iOS 15+)
            case false:
                switch(jellyfinService.isLoggedIn) {
                case true:
                    RootLoggedInView()
                case false:
                    LoginPage()
                }
            }
        }
    }
}
    

        
    


#Preview {
    ContentView()
}
